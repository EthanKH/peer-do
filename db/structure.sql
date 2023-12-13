CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "taskies" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "description" text, "due_date" date, "due_time" time, "completion" integer, "ping_frequency" integer, "owner_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_e49d137ec8"
FOREIGN KEY ("owner_id")
  REFERENCES "owners" ("id")
);
CREATE INDEX "index_taskies_on_owner_id" ON "taskies" ("owner_id");
CREATE TABLE IF NOT EXISTS "pings" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "poker_id" integer NOT NULL, "task_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_fb5a61cb74"
FOREIGN KEY ("poker_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_07e2288ba9"
FOREIGN KEY ("task_id")
  REFERENCES "tasks" ("id")
);
CREATE INDEX "index_pings_on_poker_id" ON "pings" ("poker_id");
CREATE INDEX "index_pings_on_task_id" ON "pings" ("task_id");
CREATE TABLE IF NOT EXISTS "users" ("id" integer NOT NULL PRIMARY KEY, "email" text DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar DEFAULT NULL, "reset_password_sent_at" datetime(6) DEFAULT NULL, "remember_created_at" datetime(6) DEFAULT NULL, "username" text DEFAULT NULL, "private" boolean DEFAULT 1, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "pings_count" integer DEFAULT 0, "tasks_count" integer DEFAULT 0, "friendship_id" integer, "og_name" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE TABLE IF NOT EXISTS "friend_requests" ("id" integer NOT NULL PRIMARY KEY, "receiver_id" integer NOT NULL, "sender_id" integer NOT NULL, "status" varchar DEFAULT 'pending', "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_9f6f8488d3"
FOREIGN KEY ("sender_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_099388ad25"
FOREIGN KEY ("receiver_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_friend_requests_on_sender_id" ON "friend_requests" ("sender_id");
CREATE INDEX "index_friend_requests_on_receiver_id" ON "friend_requests" ("receiver_id");
CREATE TABLE IF NOT EXISTS "tasks" ("id" integer NOT NULL PRIMARY KEY, "description" text DEFAULT NULL, "due_date" date DEFAULT NULL, "due_time" time DEFAULT NULL, "completion" boolean DEFAULT NULL, "ping_frequency" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "owner_id" integer NOT NULL, "pings_count" integer DEFAULT 0, CONSTRAINT "fk_rails_877a66d795"
FOREIGN KEY ("owner_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_tasks_on_owner_id" ON "tasks" ("owner_id");
INSERT INTO "schema_migrations" (version) VALUES
('20231115164228'),
('20231116203627'),
('20231129164618'),
('20231129165502'),
('20231129180028'),
('20231129180133'),
('20231129181751'),
('20231129182110'),
('20231129182306'),
('20231129223745'),
('20231129225518'),
('20231130182413'),
('20231130182939'),
('20231130204311'),
('20231130220012'),
('20231130225230'),
('20231210052812'),
('20231210055406'),
('20231212074052');


