drop database if exists myBlog;
create database if not exists myBlog;

use myBlog;
-- ****************************** USERS ********************************
create table if not exists users
(
    username varchar(20) not null unique,
    password varchar(10) not null,
    firstName varchar(20),
    lastName varchar(30),
    isAdmin boolean not null default FALSE,
    PRIMARY KEY (username)
);

-- ****************************** blog_entries ********************************
create table if not exists blog_entries
(
    entryID int not null AUTO_INCREMENT,
    username varchar(10) not null,
    title varchar(150),
    content varchar(600),
    PRIMARY KEY (entryID),
    FOREIGN KEY (username) REFERENCES users(username) on delete cascade
);

-- ****************************** Friendships ********************************
create table if not exists friends
(
    friend1 varchar(10) not null,
    friend2 varchar(10) not null,
    PRIMARY KEY (friend1, friend2),
    FOREIGN KEY (friend1) REFERENCES users(username) on delete cascade,
    FOREIGN KEY (friend2) REFERENCES users(username) on delete cascade
);

/*
    Make sure that no matter what order you put in the friend requests,
    you don't have duplication
        No chance of: 
            Row 1) Rick, Charles
            Row 2) Charles, Rick

    Done by making sure that whatever order someone attempts to insert them,
    the usernames will always go in in alphabetical order.
*/
DELIMITER |
CREATE TRIGGER enforce_friendship_order BEFORE INSERT ON friends
  FOR EACH ROW BEGIN
    SET @lowerName := IF(NEW.friend1 < NEW.friend2, NEW.friend1, NEW.friend2);
    SET @higherName := IF(NEW.friend1 > NEW.friend2, NEW.friend1, NEW.friend2);
    SET NEW.friend1 = @lowerName;
    SET NEW.friend2 = @higherName;
  END;
|
DELIMITER ;

-- ****************************** Messages ********************************
create table if not exists messages
(
    messageID int not null AUTO_INCREMENT,
    sender varchar(10) not null,
    recipient varchar(10) not null,
    subject varchar(100) not null,
    body varchar(500) not null,
    readStatus boolean not null default FALSE,
    deletedForSender boolean not null default FALSE,
    deletedForRecipient boolean not null default FALSE,
    dateSent timestamp not null,
    PRIMARY KEY(messageID),
    FOREIGN KEY (sender) REFERENCEs users(username) on delete cascade,
    FOREIGN KEY (recipient) REFERENCES users(username) on delete cascade
);
