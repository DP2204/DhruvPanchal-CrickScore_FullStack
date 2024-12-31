
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `balls` (
  `id` int(11) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `over_number` int(11) DEFAULT NULL,
  `ball_number` int(11) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `is_out` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `balls` (`id`, `match_id`, `over_number`, `ball_number`, `runs`, `is_out`, `created_at`) VALUES
(2, 1, 0, 1, 1, 0, '2024-12-27 16:49:02'),
(3, 1, 0, 2, 2, 0, '2024-12-27 16:49:03'),
(4, 1, 0, 3, 0, 1, '2024-12-27 16:49:04'),
(5, 1, 0, 4, 0, 1, '2024-12-27 16:49:25'),
(6, 1, 0, 5, 2, 0, '2024-12-28 16:49:57'),
(7, 1, 1, 0, 2, 0, '2024-12-28 16:49:58'),
(8, 1, 1, 1, 2, 0, '2024-12-28 16:50:00'),
(9, 1, 1, 2, 2, 0, '2024-12-28 16:50:00'),
(10, 1, 1, 3, 0, 1, '2024-12-28 16:51:34'),
(11, 1, 1, 4, 6, 0, '2024-12-28 17:31:52');


CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `current_score` int(11) DEFAULT 0,
  `wickets` int(11) DEFAULT 0,
  `current_over` int(11) DEFAULT 0,
  `current_ball` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `matches` (`id`, `current_score`, `wickets`, `current_over`, `current_ball`, `created_at`) VALUES
(1, 17, 3, 1, 5, '2024-12-27 12:54:11');


ALTER TABLE `balls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`);

ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `balls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `balls`
  ADD CONSTRAINT `balls_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`);
COMMIT;