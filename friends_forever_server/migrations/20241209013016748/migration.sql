BEGIN;


--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241209013016748', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241209013016748', "timestamp" = now();

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
