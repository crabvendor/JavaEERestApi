
    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_% varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id int4 not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  serial not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  serial not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null,
        primary key (orders_id, packages_id)
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  serial not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  serial not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  serial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  serial not null,
        liters float8 not null,
        beer_id int4,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int4 not null
    )

    create table packages (
       id  serial not null,
        quantity float8 not null,
        beer_id int4,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        marketIntroductionDate date,
        name varchar(255),
        alc_percent varchar(255),
        price_for_1L float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        alc_percent varchar(255),
        marketIntroductionDate date,
        name varchar(255),
        price_for_1l float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers 
       on delete cascade

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers 
       on delete cascade

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        alc_percent varchar(255),
        marketIntroductionDate date,
        name varchar(255),
        price_for_1l float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers 
       on delete cascade

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers 
       on delete cascade

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers

    create table beers (
       id  bigserial not null,
        alc_percent varchar(255),
        marketIntroductionDate date,
        name varchar(255),
        price_for_1l float8,
        type varchar(255),
        primary key (id)
    )

    create table beers_warehouse (
       id  bigserial not null,
        liters float8 not null,
        beer_id int8,
        primary key (id)
    )

    create table clients (
       id  bigserial not null,
        address varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table containers (
       id  bigserial not null,
        capacity float8 not null,
        type varchar(255),
        price float8 not null,
        primary key (id)
    )

    create table containers_warehouse (
       id  bigserial not null,
        amount int8 not null,
        container_id int8,
        primary key (id)
    )

    create table orders (
       id  bigserial not null,
        date date,
        client_id int8,
        primary key (id)
    )

    create table orders_packages (
       orders_id int8 not null,
        packages_id int8 not null
    )

    create table packages (
       id  bigserial not null,
        quantity float8 not null,
        beer_id int8,
        container_id int8,
        primary key (id)
    )

    alter table if exists orders_packages 
       add constraint UK_niowwlutit8dr1kw5jq8o7j9h unique (packages_id)

    alter table if exists beers_warehouse 
       add constraint FKmby6qqsorf1x69tignqyict6l 
       foreign key (beer_id) 
       references beers 
       on delete cascade

    alter table if exists containers_warehouse 
       add constraint FKrdf86x70509507cu2b1645p35 
       foreign key (container_id) 
       references containers 
       on delete cascade

    alter table if exists orders 
       add constraint FKm2dep9derpoaehshbkkatam3v 
       foreign key (client_id) 
       references clients

    alter table if exists orders_packages 
       add constraint FK7565m5d1rim722gcd2bybad3m 
       foreign key (packages_id) 
       references packages

    alter table if exists orders_packages 
       add constraint FKjd8oom6hnwwfc8wi3kor3lij0 
       foreign key (orders_id) 
       references orders

    alter table if exists packages 
       add constraint FKw05nfjq5c56awq4ujli5rn0m 
       foreign key (beer_id) 
       references beers

    alter table if exists packages 
       add constraint FKccytbe9h8wqr3yidsu5mhssl9 
       foreign key (container_id) 
       references containers
