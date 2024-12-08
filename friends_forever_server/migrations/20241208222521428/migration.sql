BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "invite_code" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "code" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "inviteCode" ON "invite_code" USING btree ("code");
CREATE UNIQUE INDEX "user_info_id" ON "invite_code" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "invite_code"
    ADD CONSTRAINT "invite_code_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241208222521428', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241208222521428', "timestamp" = now();

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
