BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP CONSTRAINT "user_fk_1";
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_1"
    FOREIGN KEY("inviteCodeId")
    REFERENCES "invite_code"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241208235327778', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241208235327778', "timestamp" = now();

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