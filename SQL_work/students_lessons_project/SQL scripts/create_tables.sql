-- Создаем таблицы согласно условию


CREATE TABLE orders
             (
                          id          BIGINT UNSIGNED auto_increment PRIMARY KEY,
                          course_id   BIGINT UNSIGNED NOT NULL,
                          student_id  BIGINT UNSIGNED NOT NULL,
                          status      VARCHAR(255) collate utf8mb4_unicode_ci NOT NULL,
                          code        VARCHAR(255) charset utf8mb4 NULL,
                          token       VARCHAR(32) NOT NULL,
                          cost        INT NOT NULL,
                          terminal_id BIGINT UNSIGNED DEFAULT 1 NULL,
                          is_sbp      TINYINT(1) DEFAULT 0 NOT NULL,
                          created_at timestamp NULL,
                          updated_at timestamp NULL,
                          CONSTRAINT orders_course_id_foreign FOREIGN KEY (course_id) REFERENCES courses (id) ON
             UPDATE CASCADE
             ON
             DELETE CASCADE,
                    CONSTRAINT orders_student_id_foreign FOREIGN KEY (student_id) REFERENCES users (id)
             ON
             DELETE CASCADE,
             );


CREATE TABLE users
                   (
                                id         BIGINT UNSIGNED auto_increment PRIMARY KEY,
                                last_name  VARCHAR(255) NOT NULL,
                                first_name VARCHAR(255) NOT NULL,
                   );



CREATE TABLE course_students
                   (
                                course_id         BIGINT UNSIGNED NOT NULL,
                                student_id        BIGINT UNSIGNED NOT NULL,
                                available_lessons INT NULL,
                                CONSTRAINT course_user_orders_course_id_foreign FOREIGN KEY (course_id) REFERENCES courses (id) ON
                   UPDATE CASCADE
                   ON
                   DELETE CASCADE,
                          CONSTRAINT course_user_orders_user_id_foreign FOREIGN KEY (student_id) REFERENCES users (id)
                   ON
                   DELETE CASCADE
                   );


CREATE TABLE courses
                         (
                                      id          BIGINT UNSIGNED PRIMARY KEY,
                                      course_name VARCHAR(255) NOT NULL,
                         );