BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "friends" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "friendInfoId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "friend_list_index" ON "friends" USING btree ("userInfoId", "friendInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "inviteCodeId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_index" ON "user" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "friends"
    ADD CONSTRAINT "friends_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "friends"
    ADD CONSTRAINT "friends_fk_1"
    FOREIGN KEY("friendInfoId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_1"
    FOREIGN KEY("inviteCodeId")
    REFERENCES "invite_code"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241208234148054', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241208234148054', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
