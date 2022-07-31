from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import datetime
import json,os
from werkzeug.utils import secure_filename
from flask_mail import Mail


with open('config.json','r') as myfile:
    myjson=json.load(myfile)['params']

app = Flask(__name__)
app.config['SECRET_KEY'] = "Your_secret_string"
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT = 465,
    MAIL_USE_SSL=True,
    MAIL_USERNAME = myjson['gmail_user'],
    MAIL_PASSWORD = myjson['gmail_password']
)
mail = Mail(app)


if(myjson['local_server']):
    app.config['SQLALCHEMY_DATABASE_URI'] = myjson['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = myjson['prod_uri']

db = SQLAlchemy(app)

class Contact(db.Model):
    SerialNumber = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), nullable=False)
    EmailAddress = db.Column(db.String(20), nullable=False)
    PhoneNumber = db.Column(db.String(20), nullable=False)
    Message = db.Column(db.String(120), nullable=False)
    DateTime = db.Column(db.String(20), nullable=True)

class Posts(db.Model):
    SerialNumber = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(80), nullable=False)
    SubTitle = db.Column(db.String(80), nullable=False)
    Content = db.Column(db.String(1200), nullable=False)
    ImgFile = db.Column(db.String(20), nullable=False)
    SlugName = db.Column(db.String(20), nullable=False)
    PostedBy = db.Column(db.String(20), nullable=False)
    Date = db.Column(db.String(20), nullable=True)

@app.route("/")
def home():
    post=Posts.query.filter_by().all()[0:myjson['no_of_posts']]
    return render_template("index.html",myparam=myjson,mypost=post,prev=0,next=1)

@app.route("/<string:index>")
def navigator(index):
    if(int(index)<0):
        index=0

    limit=len(Posts.query.filter_by().all())//myjson['no_of_posts']

    if(int(index)>limit):
        index=limit

    start=int(index)*myjson['no_of_posts']
    end=start+myjson['no_of_posts']
    post=Posts.query.filter_by().all()[start:end]
    # mynext=myjson['no_of_posts']
    if (int(index)-1<=0):
        myprev=0
    else:
        myprev=int(index)-1
    

    if (int(index)+1>limit):
        mynext=limit
    else:
        mynext=int(index)+1

    return render_template("index.html",myparam=myjson,mypost=post,prev=myprev,next=mynext)

@app.route("/about")
def about():
    return render_template("about.html",myparam=myjson)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/uploader",methods=['GET','POST'])
def upload():
    if('user' in session and session['user']==myjson['Jemail']):
        if(request.method=='POST'):
            file=request.files['Myfile']
            file.save(os.path.join(myjson['Jfile_location'],secure_filename(file.filename)))
            return "File uploaded successfull"

@app.route("/delete/<string:srdelete>")
def delete(srdelete):
    if('user' in session and session['user']==myjson['Jemail']):
        post=Posts.query.filter_by(SerialNumber=srdelete).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route("/edit/<string:sredit>",methods=['GET','POST'])
def edit(sredit):
    if('user' in session and session['user']==myjson['Jemail']):
        if(request.method=='POST'):
            reqtitle=request.form.get('MYtitle')
            reqsubtitle=request.form.get('MYsubtitle')
            reqimgfile=request.form.get('MYimagefile')
            reqslugname=request.form.get('MYslugname')
            reqpostedby=request.form.get('MYpostedby')
            reqmycontent=request.form.get('MYcontent')

            if(sredit=='0'):    
                entry = Posts(Title=reqtitle,SubTitle=reqsubtitle, ImgFile=reqimgfile, SlugName=reqslugname,PostedBy=reqpostedby,Content=reqmycontent,Date=datetime.datetime.now())
                db.session.add(entry)
                db.session.commit()
            else:
                post=Posts.query.filter_by(SerialNumber=sredit).first()
                post.Title=reqtitle
                post.SubTitle=reqsubtitle
                post.ImgFile=reqimgfile
                post.SlugName=reqslugname
                post.PostedBy=reqpostedby
                post.Content=reqmycontent
                db.session.commit()
                return redirect("/edit/"+sredit)
                
    post=Posts.query.filter_by(SerialNumber=sredit).first()
    return render_template("edit.html",myparam=myjson,srno=sredit,mypost=post)

@app.route("/dashboard",methods=['GET','POST'])
def signin():
    if('user' in session and session['user']==myjson['Jemail']):
        post=Posts.query.filter_by().all()
        return render_template("dashboard.html",myparam=myjson,mypost=post)

    if(request.method=='POST'):
        email=request.form.get('Hemail')
        password=request.form.get('Hpassword')
        if(email==myjson['Jemail'] and password==myjson['Jpassword']):
            session['user']=email
            post=Posts.query.filter_by().all()
            return render_template("dashboard.html",myparam=myjson,mypost=post)
    
    return render_template("signin.html",myparam=myjson)

@app.route("/post/<string:postSlug>",methods=['GET'])
def post_route(postSlug):
    post=Posts.query.filter_by(SlugName=postSlug).first()
    return render_template("post.html",myparam=myjson,mypost=post)

@app.route("/contact",methods=['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name=request.form.get('MYname')
        email=request.form.get('MYemail')
        phone=request.form.get('MYphone')
        message=request.form.get('MYmessage')
        entry = Contact(Name=name,EmailAddress=email, PhoneNumber=phone, Message=message,DateTime=datetime.datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('new message(flask) from '+ name,sender=email,recipients = ['ra10011996@gmail.com'],body=f"Message:{message}\nPhoneNumber:{phone}\nEmailId:{email}")

    return render_template("contact.html",myparam=myjson)

# app.run()
app.run(debug=True)