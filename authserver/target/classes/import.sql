/* USERS */
create table users(
  username varchar_ignorecase(50) not null primary key,
  password varchar_ignorecase(50) not null,
  enabled boolean not null);

create table authorities (
  username varchar_ignorecase(50) not null,
  authority varchar_ignorecase(50) not null,
  constraint fk_authorities_users foreign key(username) references users(username));
create unique index ix_auth_username on authorities (username,authority);

insert into users (username, password, enabled) values ('admin', 'admin', true);
insert into authorities (username, authority) values ('admin', 'ROLE_ADMIN');



/* CLIENTS */
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

insert into oauth_client_details (client_id, client_secret, authorized_grant_types, scope) values
  ('BaMSG_Web', 'bamsg_web_secret', 'authorization_code,refresh_token,password', 'openid,theses');