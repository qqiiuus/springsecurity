use pinyougou;
create table clientdetails
(
    appId                  varchar(128)  not null
        primary key,
    resourceIds            varchar(256)  null,
    appSecret              varchar(256)  null,
    scope                  varchar(256)  null,
    grantTypes             varchar(256)  null,
    redirectUrl            varchar(256)  null,
    authorities            varchar(256)  null,
    access_token_validity  int           null,
    refresh_token_validity int           null,
    additionalInformation  varchar(4096) null,
    autoApproveScopes      varchar(256)  null
)
    charset = utf8;

create table oauth_access_token
(
    token_id          varchar(256) null,
    token             blob         null,
    authentication_id varchar(128) not null
        primary key,
    user_name         varchar(256) null,
    client_id         varchar(256) null,
    authentication    blob         null,
    refresh_token     varchar(256) null
)
    charset = utf8;

create table oauth_approvals
(
    userId         varchar(256) null,
    clientId       varchar(256) null,
    scope          varchar(256) null,
    status         varchar(10)  null,
    expiresAt      timestamp    null,
    lastModifiedAt timestamp    null
)
    charset = utf8;

create table oauth_client_details
(
    client_id               varchar(128)  not null
        primary key,
    resource_ids            varchar(256)  null,
    client_secret           varchar(256)  null,
    scope                   varchar(256)  null,
    authorized_grant_types  varchar(256)  null,
    web_server_redirect_uri varchar(256)  null,
    authorities             varchar(256)  null,
    access_token_validity   int           null,
    refresh_token_validity  int           null,
    additional_information  varchar(4096) null,
    autoapprove             varchar(256)  null
)
    charset = utf8;

create table oauth_client_token
(
    token_id          varchar(256) null,
    token             blob         null,
    authentication_id varchar(128) not null
        primary key,
    user_name         varchar(256) null,
    client_id         varchar(256) null
)
    charset = utf8;

create table oauth_code
(
    code           varchar(256) null,
    authentication blob         null
)
    charset = utf8;

create table oauth_refresh_token
(
    token_id       varchar(256) null,
    token          blob         null,
    authentication blob         null
)
    charset = utf8;

create table tb_content
(
    id          bigint auto_increment
        primary key,
    category_id bigint       not null comment '内容类目ID',
    title       varchar(200) null comment '内容标题',
    sub_title   varchar(100) null comment '子标题',
    title_desc  varchar(500) null comment '标题描述',
    url         varchar(500) null comment '链接',
    pic         varchar(300) null comment '图片绝对路径',
    pic2        varchar(300) null comment '图片2',
    content     text         null comment '内容',
    created     datetime     null,
    updated     datetime     null
)
    charset = utf8;

create index category_id
    on tb_content (category_id);

create index updated
    on tb_content (updated);

create table tb_content_category
(
    id         bigint auto_increment comment '类目ID'
        primary key,
    parent_id  bigint               null comment '父类目ID=0时，代表的是一级的类目',
    name       varchar(50)          null comment '分类名称',
    status     int(1)     default 1 null comment '状态。可选值:1(正常),2(删除)',
    sort_order int(4)               null comment '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
    is_parent  tinyint(1) default 1 null comment '该类目是否为父类目，1为true，0为false',
    created    datetime             null comment '创建时间',
    updated    datetime             null comment '创建时间'
)
    comment '内容分类' charset = utf8;

create index parent_id
    on tb_content_category (parent_id, status);

create index sort_order
    on tb_content_category (sort_order);

create table tb_permission
(
    id          bigint auto_increment
        primary key,
    parent_id   bigint       null comment '父权限',
    name        varchar(64)  not null comment '权限名称',
    enname      varchar(64)  not null comment '权限英文名称',
    url         varchar(255) not null comment '授权路径',
    description varchar(200) null comment '备注',
    created     datetime     not null,
    updated     datetime     not null
)
    comment '权限表' charset = utf8;

create table tb_role
(
    id          bigint auto_increment
        primary key,
    parent_id   bigint       null comment '父角色',
    name        varchar(64)  not null comment '角色名称',
    enname      varchar(64)  not null comment '角色英文名称',
    description varchar(200) null comment '备注',
    created     datetime     not null,
    updated     datetime     not null
)
    comment '角色表' charset = utf8;

create table tb_role_permission
(
    id            bigint auto_increment
        primary key,
    role_id       bigint not null comment '角色 ID',
    permission_id bigint not null comment '权限 ID'
)
    comment '角色权限表' charset = utf8;

create table tb_user
(
    id       bigint auto_increment
        primary key,
    username varchar(50) not null comment '用户名',
    password varchar(64) not null comment '密码，加密存储',
    phone    varchar(20) null comment '注册手机号',
    email    varchar(50) null comment '注册邮箱',
    created  datetime    not null,
    updated  datetime    not null,
    constraint email
        unique (email),
    constraint phone
        unique (phone),
    constraint username
        unique (username)
)
    comment '用户表' charset = utf8;

create table tb_user_role
(
    id      bigint auto_increment
        primary key,
    user_id bigint not null comment '用户 ID',
    role_id bigint not null comment '角色 ID'
)
    comment '用户角色表' charset = utf8;

