from flask import render_template, request, Blueprint
from flaskblog.models import Post
import sqlite3

main = Blueprint('main', __name__)


@main.route("/")
@main.route("/home")
def home():
    page = request.args.get('page', 1, type=int)
    posts = Post.query.order_by(Post.date_posted.desc()).paginate(page=page, per_page=100)

    return render_template('home.html', posts=posts)


@main.route("/about")
def about():
    return render_template('about.html', title='About')



@main.route('/post', methods=['POST'])
def post():
    try:
        if request.method == 'POST':
            content = request.get_json()
            ip = content['query']
            city = content['city']
            country = content['country']
            lat = content['lat']
            lon = content['lon']
            browser = content['browser']
            with sqlite3.connect('database.db') as con:
                cur = con.cursor()
                cur.execute("INSERT INTO client (ip, city, country, lat, lon, browser) VALUES (?, ?, ?, ?, ?, ?)",
                            (ip, city, country, lat, lon, browser))
                con.commit()
                msg = "Record successfully added"
    except:
        con.rollback()
        msg = "ERROR in insert operation!!"
        print(msg)

    finally:
        #con.close()
        return msg
