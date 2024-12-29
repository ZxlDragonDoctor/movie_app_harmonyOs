
create database if not exists movie;
use movie;

/**
  *用户表
 */
create table if not exists movie_user
(
    id       int auto_increment comment '主键id'
        primary key,
    username varchar(18)  not null comment '用户名称',
    password varchar(32)  not null comment '用户密码',
    avatar   varchar(100) null comment '用户头像',
    nickname varchar(18)  null comment '用户昵称',
    constraint unique_username
        unique (username)
);
alter table movie_user add COLUMN   deleted   int default 0 null comment '0未删除 1已删除';
/**
  * 电影信息表
 */

create table if not exists movie
(
    movieid   int auto_increment
        primary key,
    title     varchar(100) null comment '电影标题',
    genre     varchar(50)  null comment '电影类型',
    director  varchar(50)  null comment '导演',
    release_date varchar(50) null comment '上映日期',
    deleted   int default 0 null comment '0未删除 1已删除',
    poster    text          null comment '电影海报或宣传图链接',
    profile   varchar(200) null comment '电影简介',
    link varchar(50) null  comment '电影链接'
);

/**
  * 评论表
 */
create table if not exists movie_review
(
    id         int auto_increment comment '主键id'
        primary key,
    user_id    int not null comment '用户id',
    movie_id   int not null comment '电影id',
    content    text not null comment '评论内容',
    created_at datetime not null default current_timestamp comment '评论时间',
    constraint fk_review_user
        foreign key (user_id) references movie_user (id),
    constraint fk_review_movie
        foreign key (movie_id) references movie (movieid)
);

/**
  收藏表
 */
create table if not exists favorite_movie
(
    id         int auto_increment comment '主键id'
        primary key,
    user_id    int not null comment '用户id',
    movie_id   int not null comment '电影id',
    added_at   datetime not null default current_timestamp comment '添加收藏时间',
    constraint unique_user_favorite
        unique (user_id, movie_id),
    constraint fk_favorite_user
        foreign key (user_id) references movie_user (id),
    constraint fk_favorite_movie
        foreign key (movie_id) references movie (movieid)
);

