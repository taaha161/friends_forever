BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "apologies" (
    "id" bigserial PRIMARY KEY,
    "senderId" bigint NOT NULL,
    "recieverId" bigint NOT NULL,
    "message" text NOT NULL,
    "subject" text NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "apology_index" ON "apologies" USING btree ("senderId", "recieverId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bumps" (
    "id" bigserial PRIMARY KEY,
    "senderId" bigint NOT NULL,
    "recieverId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "bumps_index" ON "bumps" USING btree ("senderId", "recieverId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "letters" (
    "id" bigserial PRIMARY KEY,
    "senderId" bigint NOT NULL,
    "recieverId" bigint NOT NULL,
    "message" text NOT NULL,
    "subject" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "letters_index" ON "letters" USING btree ("senderId", "recieverId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "apologies"
    ADD CONSTRAINT "apologies_fk_0"
    FOREIGN KEY("senderId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "apologies"
    ADD CONSTRAINT "apologies_fk_1"
    FOREIGN KEY("recieverId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "bumps"
    ADD CONSTRAINT "bumps_fk_0"
    FOREIGN KEY("senderId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "bumps"
    ADD CONSTRAINT "bumps_fk_1"
    FOREIGN KEY("recieverId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "letters"
    ADD CONSTRAINT "letters_fk_0"
    FOREIGN KEY("senderId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "letters"
    ADD CONSTRAINT "letters_fk_1"
    FOREIGN KEY("recieverId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR friends_forever
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('friends_forever', '20241210044221290', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241210044221290', "timestamp" = now();

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
