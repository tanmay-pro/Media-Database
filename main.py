import subprocess as sp
import pymysql
import pymysql.cursors

global curr_user_uid
curr_user_uid = -1

def insert_movie_in_watchlist(user_uid):
    try:
        new_movie = input("Enter your new media you want to add: ")
        query = "SELECT MEDIA_UID FROM MEDIA WHERE NAME='" + new_movie + "';"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        if len(output) == 0:
            print("No such media exist! Please be precise with the name")
            insert_movie_in_watchlist(user_uid)
            input('Press any key to continue>') 
            return
        movie_uid = output[0]['MEDIA_UID']
        query = "SELECT USER_UID FROM TO_WATCH WHERE MEDIA_UID=" + str(movie_uid) + " AND USER_UID=" + str(user_uid) + ";"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        if len(output) == 0:
            query = "INSERT INTO TO_WATCH VALUES (" + str(user_uid) + ", " + str(movie_uid) + ");"
            cur.execute(query)
            con.commit()
            print(new_movie + " has been inserted in your watchlist")
        else:
            print(new_movie + " already exists in your watchlist")
        input('Press any key to continue>') 
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_review(user_uid):
    try:
        movie = input("Which media do you want to rate: ")
        query = "SELECT MEDIA_UID FROM MEDIA WHERE NAME='" + movie +"';"
        cur.execute(query)
        output = cur.fetchall()
        if len(output) == 0:
            print("No such media exist! Please be precise with the name")
            insert_review(user_uid)
            return
        movie_uid = output[0]['MEDIA_UID']
        query = "SELECT USER_UID FROM REVIEW WHERE MEDIA_UID=" + str(movie_uid) + " AND USER_UID=" + str(user_uid) + ";"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
    
        if len(output) == 0:
            rating = -1
            while rating < 0 or rating > 10:
                rating = input("Give a rating from 0 to 10: ")
            decision = input("Do you wish to submit a review for this movie too (y/n): ")
            while decision != 'y' or decision != 'n':
                decision = input("Invalid input! Do you wish to submit a review for this movie too (y/n): ")
            if decision == 'y':
                review = input("Please write a review: ")
                query = "INSERT INTO REVIEW VALUES (" + str(user_uid) + ", " + str(movie_uid) + ", " + str(rating) + ", '" + review + "');"
            else:
                query = "INSERT INTO REVIEW (USER_UID, MEDIA_UID, RATING) VALUES (" + + str(user_uid) + ", " + str(output[0]['MEDIA_UID']) + ", " + str(rating) + ");"
        
            cur.execute(query)
            con.commit()
            print("Thank you! Your review has been registered.")
        else:
            print("You have already reviewed " + movie)
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_fav_genre(user_uid):
    try:
        genre = input("What genre do you want to like: ")
        query = "SELECT GENRE_NAME FROM GENRE WHERE GENRE_NAME='" + genre + "';"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        if len(output) == 0:
            print("No such genre exists!")
            insert_fav_genre(user_uid)
            return
        query = "SELECT USER_UID FROM LIKES WHERE GENRE_NAME='" + genre + "' AND USER_UID=" + str(user_uid) + ";"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()

        if len(output) != 0:
            print("You have already liked this genre")
        else:
            query = "INSERT INTO LIKES VALUES (" + str(user_uid) + ", '" + genre + "')"
            cur.execute(query)
            con.commit()
            print(genre + " has been added to your likes")
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def delete_user(u_uid):
    try:
        decision = input("Are you sure you want to delete the user. Press y for yes: ")
        if decision == 'y' or decision == 'Y':
            query = "DELETE FROM USER WHERE USER_UID=" + str(u_uid)
            cur.execute(query)
            con.commit()
        input('Press any key to continue>')
        user()
        return
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def delete_media_from_watchlist():
    try:
        movie = input("Which media to you want to delete: ")
        query = "SELECT MEDIA_UID FROM MEDIA WHERE NAME='" + movie + "';"
        cur.execute(query)
        con.commit()
        output = cur.fetchall()
        if len(output) == 0:
            print("No such media exists")
            return
    
        decision = input("Are you sure you want to delete the media (y/n): ")
        if decision == 'y' or decision == 'Y':
            query = "DELETE FROM TO_WATCH WHERE MEDIA_UID=" + str(output[0]['MEDIA_UID']) + " AND USER_UID=" + str(user_uid) + ";"
            cur.execute(query)
            con.commit()
        # cur.execute(query)
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def retrieve_top_films():
    value = int(input("Enter the value of box office earnings in millions: "))
    query = "SELECT * FROM FILM WHERE FILM.BOX_OFFICE_EARNINGS > %s;" % (value)
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print("No such movie exists")
    else:    
        for i in output:
            print(i)
    input('Press any key to continue>')

def retrieve_film_on_duration():
    value = int(input("Enter the duration in minutes: "))
    query = "SELECT * FROM FILM WHERE FILM.DURATION < %s;" % (value)
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print("No such movie exists")
    else:    
        for i in output:
            print(i)
    input('Press any key to continue>')

def retrieve_show_on_episodes():
    value = int(input("Enter the number of episodes: "))
    query = "SELECT TV_SERIES.* \
    FROM TV_SERIES, (SELECT TV_SERIES_UID, COUNT(TV_SERIES_UID) AS VAL \
    FROM EPISODE GROUP BY TV_SERIES_UID) TEMP \
    WHERE TV_SERIES.MEDIA_UID = TEMP.TV_SERIES_UID AND TEMP.VAL < %s;" % (value)
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print("No such TV Series exists")
    else:    
        for i in output:
            print(i)
    input('Press any key to continue>')

def retrieve_crew():
    query = "SELECT FIRST_NAME, MIDDLE_NAME, LAST_NAME, BIO FROM CREW;"
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print("Empty Crew Table")
    else:    
        for i in output:
            print(i)
    input('Press any key to continue>')

def retrieve_media():
    query = "SELECT * FROM MEDIA INNER JOIN LANGUAGES ON MEDIA.MEDIA_UID = LANGUAGES.MEDIA_UID;"
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print("No such movie exists")
    else:    
        for i in output:
            print(i)
    input('Press any key to continue>')


def media_with_highest_rating():
    query='''SELECT MEDIA.MEDIA_UID, MEDIA.NAME, AVG(REVIEW.RATING) AS AVERAGE
    FROM REVIEW
    INNER JOIN MEDIA
    ON MEDIA.MEDIA_UID=REVIEW.MEDIA_UID
    GROUP BY MEDIA.MEDIA_UID
    ORDER BY AVG(REVIEW.RATING) DESC
    LIMIT 1;'''
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print('No reviews found in the database')
    else:
        print('Highest rated movie is ', output[0]['NAME'], 'with rating', round(output[0]['AVERAGE'],2))
    input('Press any key to continue>')

def search_for_media():
    media_name = input('Enter the name or part of the name of the media you wish to search for: ')
    query = "SELECT MEDIA_UID, NAME, IS_ADULT \
    FROM MEDIA \
    WHERE NAME LIKE '%" + (media_name) + "%';" 
    cur.execute(query)
    output = cur.fetchall()
    for i in output:
        print(i)
    input('Press any key to continue>')

def search_for_crew():
    crew_name = input('Enter the name or part of the name of the crew member you wish to search for: ')
    query = "SELECT CREW_UID, FIRST_NAME, MIDDLE_NAME, LAST_NAME, BIRTH_DATE, DEATH_DATE \
    FROM CREW \
    WHERE FIRST_NAME LIKE '%" + (crew_name) + "%' \
    OR MIDDLE_NAME LIKE '%" + (crew_name) + "%' \
    OR LAST_NAME LIKE '%" + (crew_name) + "%';" 
    cur.execute(query)
    output = cur.fetchall()
    for i in output:
        print(i)
    input('Press any key to continue>')

def search_for_award_giving_organization():
    org_name = input('Enter organization name: ')
    query = "SELECT * FROM AWARD_GIVING_ORGANIZATION \
    WHERE AWARD_GIVING_ORGANIZATION_NAME LIKE '%" + (org_name) + "%';" 
    cur.execute(query)
    output = cur.fetchall()
    for i in output:
        print(i)
    input('Press any key to continue>')

def high_rated_crew_works():
    crew = input("Enter the crew UID: ")
    query = "SELECT CREW_UID FROM CREW WHERE CREW_UID='" + crew +"';"
    cur.execute(query)
    output = cur.fetchall()
    if len(output) == 0:
        print("No such crew member exist! Please enter a valid crew UID")
        insert_review()
        return
    
    threshold = float(input('Enter a threshold. Movies rated above this threshold will be displayed: '))
    cur.execute('DROP VIEW IF EXISTS TEMP;')
    query = 'CREATE VIEW TEMP AS SELECT MEDIA.* FROM MEDIA INNER JOIN REVIEW ON MEDIA.MEDIA_UID = REVIEW.MEDIA_UID WHERE RATING > ' + str(threshold) + ';'
    cur.execute(query)
    query = 'SELECT TEMP.* FROM TEMP INNER JOIN WORKS_IN ON WORKS_IN.MEDIA_UID = TEMP.MEDIA_UID WHERE CREW_UID =' + str(crew) + ';'
    cur.execute(query)
    output = cur.fetchall()
    cur.execute('DROP VIEW TEMP;')
    for i in output:
        print(i)
    input('Press any key to continue>')

def remove_genre(user_id):
    try:
        genre = input("Enter the genre name you want to remove: ")
        query = "DELETE FROM LIKES WHERE GENRE_NAME = '%s' AND USER_UID = '%s';" % (genre, user_id)
        cur.execute(query)
        con.commit()
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_user():
    try:
        fname = input("Please enter your first name: ")
        mname = input("Please enter your middle name: ")
        lname = input("Please enter your last name: ")
        email = input("Please enter your Email id: ")
        query = "INSERT INTO USER (FIRST_NAME, MIDDLE_NAME, LAST_NAME, EMAIL) VALUES ('%s', '%s', '%s', '%s');" % (fname, mname, lname, email)
        cur.execute(query)
        con.commit()
        print('Succesfully inserted user!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_media():
    try:
        name = input("Please enter media name: ")
        rating = input("Is this media rated for Adults? Enter y or n: ")
        while rating!='y' and rating!='n': 
            rating = input("Invalid Input! Is this media rated for Adults? Enter y or n: ")
        if rating == 'y': rating = True
        else: rating = False
        desc = input("Please enter media description: ")
        query = "INSERT INTO MEDIA (NAME, IS_ADULT, DESCRIPTION) VALUES ('%s', %s, '%s');" % (name, rating, desc)
        cur.execute(query)
        con.commit()
        print('Succesfully added the media!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)        

def insert_crew():
    try:
        fname = input("Please enter crew member's first name: ")
        mname = input("Please enter crew member's middle name: ")
        lname = input("Please enter crew member's last name: ")
        bio = input("Please enter your bio: ")
        bd = input("Please Enter a valid birth date in yyyy-mm-dd format: ")
        ch = input("Is the person still alive? 'Y' / 'N': ")
        if ch == 'N':
            dd = input("Please Enter a valid death date in yyyy-mm-dd format: ")
            query = "INSERT INTO CREW (FIRST_NAME, MIDDLE_NAME, LAST_NAME, BIO, BIRTH_DATE, DEATH_DATE) VALUES ('%s', '%s', '%s', '%s', '%s', '%s');" % (fname, mname, lname, bio, bd, dd)
        else:
            query = "INSERT INTO CREW (FIRST_NAME, MIDDLE_NAME, LAST_NAME, BIO, BIRTH_DATE, DEATH_DATE) VALUES ('%s', '%s', '%s', '%s', '%s', NULL);" % (fname, mname, lname, bio, bd)
        cur.execute(query)
        con.commit()
        print('Succesfully added the Crew member!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)        

def give_award():
    try:
        ch = input("Enter 1 for entering award for media and 2 for crew: ")
        if ch == '1':
            agid = int(input("Enter Award giving Organization UID: "))
            acid = int(input("Enter Award Category UID: "))
            mid =  int(input("Enter Media UID: "))
            query = "INSERT INTO AWARDED_TO_MEDIA (AWARD_GIVING_ORGANIZATION_UID, AWARD_CATEGORY_UID, MEDIA_UID) VALUES (%s, %s, %s);" % (agid, acid, mid)
            cur.execute(query)
            con.commit()
            print('Succesfully awarded to Media!')
            input('Press any key to continue>')
        elif ch == '2':
            agid = int(input("Enter Award giving Organization UID: "))
            acid = int(input("Enter Award Category UID: "))
            mid =  int(input("Enter Media UID: "))
            cid =  int(input("Enter Crew UID: "))
            query = "INSERT INTO AWARDED_TO_CREW (AWARD_GIVING_ORGANIZATION_UID, AWARD_CATEGORY_UID, MEDIA_UID, CREW_UID) VALUES (%s, %s, %s, %s);" % (agid, acid, mid, cid)
            cur.execute(query)
            con.commit()
            print('Succesfully awarded to Crew member!')
            input('Press any key to continue>')
        else:
            print("Invalid option Selected")
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_ott():
    try:
        name = input("Enter OTT name: ")
        query = "INSERT INTO OTT (OTT_NAME) VALUES ('%s')" % (name)
        cur.execute(query)
        con.commit()
        print('Succesfully added the OTT Platform(s)!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def delete_ott():
    try:
        id = int(input("Enter OTT ID: "))
        query = "DELETE FROM OTT WHERE OTT_UID = (%s)" % (id)
        cur.execute(query)
        print('Succesfully deleted the OTT Platform(s)!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def remove_review():
    try:
        uid = int(input("Enter User uid who has written the review: "))
        mid = int(input("Enter Media uid for which the review has been written: "))
        query = "DELETE FROM REVIEW WHERE USER_UID = %s AND MEDIA_UID = %s;" % (uid, mid)
        cur.execute(query)
        con.commit()
        print('Succesfully removed the review!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def remove_user():
    try:
        ch = input("Enter 1 for deleting using UID or 2 for deleting using email id: ")
        if ch == '1':
            uid = int(input("Please Enter uid to delete: "))
            query = "DELETE FROM USER WHERE USER_UID = %s;" % (uid)
            cur.execute(query)
            con.commit();
            print('Succesfully removed the user!')
            input('Press any key to continue>')
        elif ch == '2':
            email = input("Please enter email id: ")
            query = "DELETE FROM USER WHERE EMAIL = '%s';" % (email)
            cur.execute(query)
            con.commit()
            print('Succesfully removed the user!')
            input('Press any key to continue>')    
        else:
            print("Invalid option Selected")
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def update_crew_data():
    try:
        crew_id = int(input('Enter the Crew UID of the crew member you wish to update: '))
        query = "SELECT CREW_NAME FROM CREW WHERE CREW_UID=" + str(crew_id) + ";"
        if len(query) == 0:
            print('\nNo crew member with the UID', str(crew_id), 'exists! Please try again')
            update_crew_data()
            return
        else:
            fname = input("Please enter crew member's first name: ")
            mname = input("Please enter crew member's middle name: ")
            lname = input("Please enter crew member's last name: ")
            bio = input("Please enter crew member's bio: ")
            bd = input("Please Enter a valid birth date in yyyy-mm-dd format: ")
            ch = input("Is the person still alive? 'Y' / 'N': ")
            if ch == 'N':
                dd = input("Please Enter a valid death date in yyyy-mm-dd format.: ")
                query = "UPDATE CREW SET FIRST_NAME='%s', MIDDLE_NAME='%s', LAST_NAME='%s', BIO='%s', BIRTH_DATE='%s', DEATH_DATE=%s WHERE CREW_UID=%s;" % (fname, mname, lname, bio, bd, dd, crew_id)
            else:
                query = "UPDATE CREW SET FIRST_NAME='%s', MIDDLE_NAME='%s', LAST_NAME='%s', BIO='%s', BIRTH_DATE='%s', DEATH_DATE=NULL WHERE CREW_UID=%s;" % (fname, mname, lname, bio, bd, crew_id)
            cur.execute(query)
            con.commit()
            print('Succesfully updated crew data!')
            input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def insert_movie_ott():
    try:
        oid =  int(input("Enter Media UID: "))
        mid = int(input("Enter OTT ID: "))
        country = input("Enter Country name in which the Media has been released on the specified OTT: ")
        query = "SELECT * FROM AVAILABLE_ON WHERE MEDIA_UID=%s AND OTT_UID=%s AND COUNTRY='%s'" % (oid, mid, country)
        cur.execute(query)
        output = cur.fetchall()
        if len(output) != 0:
            print("This media on this ott in this country is already available! No need to enter again")
        else:
            query = "INSERT INTO AVAILABLE_ON VALUES (%s, %s, '%s');" %(oid, mid, country)
            cur.execute(query)
            con.commit()
            print('Succesfully added media to ott!')
            input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

def delete_movie_ott():
    try:
        oid =  int(input("Enter Media UID: "))
        mid = int(input("Enter OTT ID: "))
        country = input("Enter Country name in which the Media has been released on the specified OTT: ")
        query = "DELETE FROM AVAILABLE_ON WHERE OTT_UID = %s AND MEDIA_UID = %s AND COUNTRY = '%s'" %(oid, mid, country)
        cur.execute(query)
        con.commit()
        print('Succesfully deleted media from ott!')
        input('Press any key to continue>')
    except Exception as e:
        con.rollback()
        print('Unsuccessful!')
        print(e)

# User interface:

def display_admin_options():
    tmp = sp.call('clear', shell=True)
    print("Choose any one of the following options by entering the number in front of it")
    print("""1. Insert media data
2. Insert data about new crew
3. Insert new accolades presented to staff or media
4. Insert data about a new OTT platform
5. Delete ott
6. Remove certain comments (can be done by moderators)
7. Remove data of a user from the database
8. Update crew bio tuple
9. Add a media to a OTT
10. Delete media from an OTT
11. Logout
""")
    decision = int(input("Enter your choice: "))
    if decision == 1:
        insert_media()
    elif decision == 2:
        insert_crew()
    elif decision == 3:
        give_award()
    elif decision == 4:
        insert_ott()
    elif decision == 5:
        delete_ott()
    elif decision == 6:
        remove_review()
    elif decision == 7:
        remove_user()
    elif decision == 8:
        update_crew_data()
    elif decision == 9:
        insert_movie_ott()
    elif decision == 10:
        delete_movie_ott()
    elif decision == 11:
        return
    else:
        print("INVALID INPUT! Try Again")
    display_admin_options()

def admin():
    print("Hello Admin!")
    display_admin_options()

def display_user_options(curr_user_uid):
    tmp = sp.call('clear', shell=True)
    print("Choose any one of the following options by entering the number in front of it")
    print("1. Insert new media in user watchlist\n \
2. Insert a review and rating\n \
3. Insert a new favourite genre of a user (When user likes a new genre)\n \
4. Remove data of the own user from the database if required\n \
5. Remove movie from user watchlist\n \
6. Retrieve complete data tuples of films that have grossed more than x million USD\n \
7. Retrieve complete data tuples of movies that have a duration of fewer than x minutes\n \
8. Retrieve complete data tuples of shows with less than x number of episodes\n \
9. Name and Bio of a Crew\n \
10. Name, Description, Language, and Is Adult of a Media\n \
11. Search media with the highest average rating\n \
12. Search media names based on partial text match\n \
13. Search crew names based on partial text match\n \
14. Search for a particular award giving organization\n \
15. Given a crew like an actor or director, find how many movies they’ve worked on have a rating greater than a particular threshold value\n \
16. Remove a previously favourite genre of a user \n \
17. Logout")
    print()
    decision = int(input("Enter your choice: "))
    if decision == 1:
        insert_movie_in_watchlist(curr_user_uid)
    elif decision == 2:
        insert_review(curr_user_uid)
    elif decision == 3:
        insert_fav_genre(curr_user_uid)
    elif decision == 4:
        delete_user(curr_user_uid)
    elif decision == 5:
        delete_media_from_watchlist()
    elif decision == 6:
        retrieve_top_films()
    elif decision == 7:
        retrieve_film_on_duration()
    elif decision == 8:
        retrieve_show_on_episodes()
    elif decision == 9:
        retrieve_crew()
    elif decision == 10:
        retrieve_media()
    elif decision == 11:
        media_with_highest_rating()
    elif decision == 12:
        search_for_media()
    elif decision == 13:
        search_for_crew()
    elif decision == 14:
        search_for_award_giving_organization()
    elif decision == 15:
        high_rated_crew_works()
    elif decision == 16:
        remove_genre(curr_user_uid)
    elif decision == 17:
        curr_user_uid = -1
        return
    else:
        print("INVALID INPUT! Try again")
    display_user_options(curr_user_uid)


def existing_user():
    print("Enter your email address")
    existing_email = input()

    query = "SELECT USER_UID, FIRST_NAME FROM USER WHERE \
                EMAIL='%s';" % (existing_email)
    cur.execute(query)
    output = cur.fetchall()
    if len(output)==0:
        print('Invalid Email! Please try again or create a new account')
        input('Press any key to continue>')
        user()
    else:
        curr_user_uid = output[0]['USER_UID']
        print('Welcome,', output[0]['FIRST_NAME'], 'Your user ID is', curr_user_uid)
        input('Press any key to continue>')
        display_user_options(curr_user_uid)

def user():
    tmp = sp.call('clear', shell=True)
    print("Hello User!")
    print('''Are you an 
    1. Existing user
    2. New user''')
    print()
    c = int(input("Enter your Choice: "))
    if c == 1:
        existing_user()
    elif c==2:
        insert_user()
        user()
    else:
        print("Incorrect input")


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """
    if(ch == 1):
        admin()
    elif(ch == 2):
        user()
    else:
        print("Error: Invalid Option")


while(1):
    tmp = sp.call('clear', shell=True)
    
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=30306,
                              user="root",
                              password="password",
                              db='MOVIEDATABASE',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")
    
        with con.cursor() as cur:
            
            while(1):
                curr_user_uid = -1
                tmp = sp.call('clear', shell=True)
                print("\nSelect your role")  
                print("     1. Admin")  
                print("     2. User")  
                print("     3. Exit")    
                choice = int(input("Enter your Choice: "))
                tmp = sp.call('clear', shell=True)
                if choice == 3:
                    exit()
                else:
                    dispatch(choice)
                    tmp = input("Enter any key to CONTINUE>") 
    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")