CREATE TABLE calendars (
    id
         INT NOT NULL,
    calendar_slug
         CHAR(26) NOT NULL,
    slug
         VARCHAR(40) NOT NULL,
    CONSTRAINT calendars__calendar_slug__slug__uq
      UNIQUE (calendar_slug ASC, slug ASC)
);
CREATE TABLE calendar_events (
    id
        INT NOT NULL,
    calendar_id
        INT NOT NULL,
    slug
           VARCHAR(40) NOT NULL
);
INSERT
INTO
    calendars
(
    id,
    calendar_slug,
    slug
)
VALUES
(
    1,
    'acme',
    'geek-calendar'
);
INSERT
INTO
    calendars
(
    id,
    calendar_slug,
    slug
)
VALUES
(
    2,
    'acme',
    'funny-calendar'
);
INSERT
INTO
    calendar_events
(
    id,
    calendar_id,
    slug
)
VALUES
(
    1,
    1,
    'may-4'
);
INSERT
INTO
    calendar_events
(
    id,
    calendar_id,
    slug
)
VALUES
(
    2,
    2,
    'march-14'
);
