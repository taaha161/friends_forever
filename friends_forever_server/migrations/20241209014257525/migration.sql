BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "friends" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "friends" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "friendId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "deletedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "friend_list_index" ON "friends" USING btree ("userId", "friendId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "friends"
    ADD CONSTRAINT "friends_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "friends"
    ADD CONSTRAINT "friends_fk_1"
    FOREIGN KEY("friendId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241209014257525', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241209014257525', "timestamp" = now();

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
