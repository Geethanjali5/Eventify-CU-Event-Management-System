INSERT INTO organizers(organizer_id, name, type)
    VALUES (1, 'EGSC', 2),
    (2, 'ISSO', 1),
    (3, 'CS Department', 1),
    (4, 'Career Cell', 1),
    (5, 'Columbia GSAS', 1),
    (6, 'Columbia Climate School', 1),
    (7, 'Columbia Sports Club', 2),
    (8, 'Columbia SEAS', 1),
    (9, 'ESA', 2),
    (10, 'Columbia Data Science Institute', 1);


INSERT INTO campuses(name, address, opens, closes)
VALUES
('Morningside', 'Broadway & 116th St', '08:00:00', '22:00:00'),
('Manhattanville', '125th & Broadway', '09:00:00', '21:00:00'),
('Medical Center', '168th St & Fort Washington Ave', '07:30:00', '19:00:00'),
('Teachers College', '525 W 120th St', '08:30:00', '20:00:00'),
('Law School', '435 W 116th St', '09:00:00', '18:00:00'),
('Business School', 'Uris Hall, NY 10027', '09:00:00', '18:30:00'),
('Journalism School', '2950 Broadway, NY 10027', '09:00:00', '19:00:00'),
('Engineering', '500 W 120th St', '08:00:00', '21:00:00'),
('Barnard College', '3009 Broadway, NY 10027', '08:30:00', '19:30:00'),
('School of Social Work', '1255 Amsterdam Ave', '09:00:00', '18:00:00');


INSERT INTO locations(venue, address, capacity, campus)
VALUES
('Lerner Hall', '2920 Broadway, NY 10027', 500, 'Morningside'),
('Butler Library', '535 W 114th St, NY 10027', 200, 'Morningside'),
('Faculty House', '64 Morningside Dr, NY 10027', 300, 'Morningside'),
('Alfred Lerner Hall', '2920 Broadway, NY 10027', 350, 'Morningside'),
('Schapiro Center', '530 W 120th St, NY 10027', 400, 'Engineering'),
('Uris Hall', '3022 Broadway, NY 10027', 300, 'Business School'),
('Columbia Journalism School', '2950 Broadway, NY 10027', 250, 'Journalism School'),
('Barnard Hall', '3009 Broadway, NY 10027', 150, 'Barnard College'),
('Low Library', '535 W 116th St, NY 10027', 600, 'Morningside'),
('Dodge Hall', '2960 Broadway, NY 10027', 150, 'Morningside');



INSERT INTO events(event_id, name, event_time, description, event_type, organizer_id, location)
VALUES
(1, 'Career Fair', '2024-11-15 10:00:00', 'Annual career fair for students', 'Networking', 4, 'Lerner Hall'),
(2, 'Data Science Symposium', '2024-12-05 09:00:00', 'Data Science research presentations', 'Conference', 10, 'Faculty House'),
(3, 'Climate Action Workshop', '2024-11-01 13:00:00', 'Climate advocacy workshop', 'Workshop', 6, 'Butler Library'),
(4, 'Sports Meet', '2024-10-20 10:00:00', 'Annual inter-college sports meet', 'Sports', 7, 'Schapiro Center'),
(5, 'SEAS Tech Talk', '2024-11-03 14:00:00', 'Tech advancements in engineering', 'Talk', 8, 'Uris Hall'),
(6, 'Journalism Ethics Panel', '2024-10-23 16:00:00', 'Panel discussion on ethics in journalism', 'Panel', 9, 'Columbia Journalism School'),
(7, 'Networking Mixer', '2024-10-29 17:00:00', 'Mixer for business students', 'Social', 5, 'Uris Hall'),
(8, 'Engineering Hackathon', '2024-12-10 08:00:00', 'Hackathon for SEAS students', 'Competition', 8, 'Schapiro Center'),
(9, 'Art Exhibition', '2024-10-21 12:00:00', 'Exhibition of student artwork', 'Exhibition', 1, 'Lerner Hall'),
(10, 'Tech Bootcamp', '2024-12-15 09:00:00', 'Bootcamp for coding skills', 'Workshop', 3, 'Dodge Hall');


INSERT INTO tickets(ticket_id, fee, ticket_type, event_id)
VALUES
(1, 20, 'Regular', 1),
(2, 0, 'Student', 2),
(3, 15, 'Regular', 3),
(4, 10, 'Student', 4),
(5, 5, 'Student', 5),
(6, 25, 'VIP', 6),
(7, 0, 'Student', 7),
(8, 50, 'VIP', 8),
(9, 30, 'Regular', 9),
(10, 0, 'Student', 10),
(11, 20, 'Regular', 1);


INSERT INTO attendees(attendee_id, uni_id, first_name, last_name, email, department, user_type, ticket_id)
VALUES
(1, 'UNI1234', 'John', 'Doe', 'jd1234@columbia.edu', 'CS', 'Student', 1),
(2, 'UNI5678', 'Jane', 'Smith', 'js5678@columbia.edu', 'SEAS', 'Student', 2),
(3, 'UNI8765', 'Alice', 'Brown', 'ab8765@columbia.edu', 'Law', 'Staff', 3),
(4, 'UNI5432', 'Bob', 'Johnson', 'bj5432@columbia.edu', 'GSAS', 'Student', 4),
(5, 'UNI9876', 'Charlie', 'Lee', 'cl9876@columbia.edu', 'Business', 'Alumni', 5),
(6, 'UNI4321', 'Diana', 'Kim', 'dk4321@columbia.edu', 'Journalism', 'Student', 6),
(7, 'UNI1122', 'Eve', 'Adams', 'ea1122@columbia.edu', 'SEAS', 'Student', 7),
(8, 'UNI3344', 'Frank', 'Miller', 'fm3344@columbia.edu', 'Engineering', 'Student', 8),
(9, 'UNI5566', 'Grace', 'Taylor', 'gt5566@columbia.edu', 'CS', 'Faculty', 9),
(10, 'UNI7788', 'Hank', 'Wilson', 'hw7788@columbia.edu', 'Art', 'Student', 10),
(11, 'UNI5678', 'Jane', 'Smith', 'js5678@columbia.edu', 'SEAS', 'Student', 11);


INSERT INTO orders(order_id, order_date, total_price, ticket_id)
VALUES
(1, '2024-11-10 15:00:00', 20, 1),
(2, '2024-12-01 11:00:00', 0, 2),
(3, '2024-10-25 14:00:00', 15, 3),
(4, '2024-10-19 09:00:00', 10, 4),
(5, '2024-11-05 16:00:00', 5, 5),
(6, '2024-10-21 13:00:00', 25, 6),
(7, '2024-10-29 17:00:00', 0, 7),
(8, '2024-12-05 10:00:00', 50, 8),
(9, '2024-11-22 12:30:00', 30, 9),
(10, '2024-12-15 09:30:00', 0, 10),
(11, '2024-12-15 09:15:00', 20, 11);

-- Reviews for Career Fair (event_id = 1)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(1, 'Alice Johnson', 'The Career Fair was well-organized, and I met many recruiters. A great networking opportunity.'),
(1, 'David Brown', 'Helped me land an internship! The event was informative and engaging.'),
(1, 'Rachel Adams', 'This fair showcased various companies, giving a good idea of the job market.'),
(1, 'Tom Carter', 'A must-attend event for anyone looking for internships or jobs.'),
(1, 'Julia Kim', 'Got to interact with industry professionals and learn about their experiences.'),
(1, 'Liam Wilson', 'Fantastic event! The resume critique session was extremely helpful.'),
(1, 'Sophia White', 'Very crowded but worth it. The range of companies present was impressive.'),
(1, 'Emma Davis', 'The workshops were insightful and focused on real-world career challenges.'),
(1, 'Noah Scott', 'It was my first Career Fair, and I was amazed by the organization.'),
(1, 'Mia Collins', 'Loved the focus on networking and personal branding.');

-- Reviews for Data Science Symposium (event_id = 2)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(2, 'Bob Smith', 'Showcased the latest advancements in AI and machine learning. Highly recommended.'),
(2, 'Emily Green', 'The session on neural networks was exceptional. Real-world applications were explained well.'),
(2, 'John Walker', 'Great mix of academic and industry perspectives. Learned a lot about data science trends.'),
(2, 'Olivia King', 'Enjoyed the keynote speech. It inspired me to dive deeper into big data analytics.'),
(2, 'Michael Black', 'Loved the hands-on session on data visualization tools.'),
(2, 'Sophia Lee', 'The event gave me a clearer picture of how data science impacts industries.'),
(2, 'Henry Carter', 'The panel discussions were engaging and covered a wide range of topics.'),
(2, 'Isabella White', 'A fantastic opportunity to connect with professionals in the field.'),
(2, 'Lucas Adams', 'The presentations were concise and to the point. I learned something new in every session.'),
(2, 'Grace Taylor', 'As a data science student, this event was invaluable for my learning.');

-- Reviews for Climate Action Workshop (event_id = 3)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(3, 'Charlie Lee', 'Provided valuable insights on climate advocacy. The interactive sessions were great.'),
(3, 'Sophia White', 'Discussions on sustainable practices were eye-opening.'),
(3, 'Liam Brown', 'The focus on community-based solutions was fantastic.'),
(3, 'Ethan Scott', 'An inspiring event that motivated me to contribute to climate action.'),
(3, 'Emma Davis', 'The speakers were very knowledgeable and engaging.'),
(3, 'James Wilson', 'I loved the practical tips on reducing carbon footprints.'),
(3, 'Olivia Green', 'An interactive workshop that made climate advocacy approachable.'),
(3, 'Ava Adams', 'The real-world examples shared were very relatable.'),
(3, 'Lucas Miller', 'Helped me understand the challenges of climate advocacy.'),
(3, 'Mia Taylor', 'Excellent initiative! It was a well-rounded and informative workshop.');

-- Reviews for Sports Meet (event_id = 4)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(4, 'Chris Brown', 'A thrilling experience! The competitions were very well organized.'),
(4, 'Taylor Green', 'Had an amazing time participating in the track events.'),
(4, 'Morgan Scott', 'The sports meet fostered great team spirit and camaraderie.'),
(4, 'Jordan Lee', 'I loved the friendly competition and enthusiasm.'),
(4, 'Alex Wilson', 'The facilities were top-notch, and the event was fun.'),
(4, 'Jamie Adams', 'The highlight of the event was the basketball finals.'),
(4, 'Casey Carter', 'An inspiring event that brought out the best in everyone.'),
(4, 'Avery White', 'Even as a spectator, I had an incredible time.'),
(4, 'Parker Davis', 'The variety of sports was impressive and kept everyone engaged.'),
(4, 'Riley Taylor', 'The organizers did a fantastic job ensuring everything ran smoothly.');

-- Reviews for SEAS Tech Talk (event_id = 5)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(5, 'Michael Black', 'Covered groundbreaking technologies in engineering.'),
(5, 'Sophia White', 'Engaging session on the future of engineering.'),
(5, 'Ava Brown', 'The speaker explained complex topics with ease.'),
(5, 'Lucas Adams', 'Q&A session was highly informative and interactive.'),
(5, 'Mia Collins', 'Learned about emerging trends in technology.'),
(5, 'Liam Scott', 'The presentation on AI in engineering was fascinating.'),
(5, 'Olivia Green', 'Gained practical insights into engineering innovations.'),
(5, 'Ethan Davis', 'The discussion on renewable energy was particularly interesting.'),
(5, 'James Wilson', 'A must-attend event for engineering enthusiasts.'),
(5, 'Emma Davis', 'It was inspiring to see the passion of the speakers.');

-- Reviews for Journalism Ethics Panel (event_id = 6)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(6, 'Alice Johnson', 'The Journalism Ethics Panel was thought-provoking and insightful. The panelists discussed critical topics affecting modern journalism.'),
(6, 'David Brown', 'An engaging session with real-world examples on maintaining ethical standards in journalism.'),
(6, 'Rachel Adams', 'The focus on ethical dilemmas faced by journalists was very informative and eye-opening.'),
(6, 'Tom Carter', 'Loved the discussion on balancing freedom of speech with responsible reporting.'),
(6, 'Julia Kim', 'The panelists shared valuable insights on dealing with misinformation in journalism.'),
(6, 'Liam Wilson', 'An excellent session that highlighted the importance of integrity in journalism.'),
(6, 'Sophia White', 'The Q&A session was interactive and clarified many of my doubts about ethical journalism.'),
(6, 'Emma Davis', 'The examples of case studies discussed during the session were very impactful.'),
(6, 'Noah Scott', 'I appreciated the diversity of opinions and approaches shared by the panelists.'),
(6, 'Mia Collins', 'The panelists’ depth of knowledge on ethics in journalism was impressive and inspiring.');

-- Reviews for Networking Mixer (event_id = 7)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(7, 'Sophia Lee', 'The Networking Mixer was a great chance to meet business leaders.'),
(7, 'Lucas Miller', 'I connected with several professionals from my field.'),
(7, 'Mia Davis', 'Loved the friendly and welcoming atmosphere of the mixer.'),
(7, 'Ethan Carter', 'The event helped me build some valuable connections.'),
(7, 'Emma Scott', 'It was a productive evening with engaging conversations.'),
(7, 'James Wilson', 'The interactive sessions made networking easy and enjoyable.'),
(7, 'Olivia King', 'This event was perfect for business students seeking mentors.'),
(7, 'Liam Brown', 'Got some useful advice from experienced entrepreneurs.'),
(7, 'Sophia Taylor', 'I highly recommend this mixer for anyone in the business field.'),
(7, 'David White', 'The organizers did a fantastic job creating a collaborative environment.');

-- Reviews for Engineering Hackathon (event_id = 8)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(8, 'Chris Adams', 'Participating in the Engineering Hackathon was an unforgettable experience.'),
(8, 'Taylor Scott', 'The challenges were well-designed and encouraged teamwork.'),
(8, 'Morgan Brown', 'I improved my coding skills significantly during this event.'),
(8, 'Jordan Davis', 'The mentors provided excellent guidance throughout the hackathon.'),
(8, 'Alex Wilson', 'Our team managed to create a working prototype, which was rewarding.'),
(8, 'Jamie Green', 'I learned a lot about collaborative problem-solving.'),
(8, 'Avery Carter', 'The hackathon was intense but fun and highly rewarding.'),
(8, 'Parker Taylor', 'The workshops before the hackathon were very helpful.'),
(8, 'Riley White', 'The closing ceremony was a highlight, with impressive project demos.'),
(8, 'Sophia King', 'Great opportunity to work with like-minded peers and learn.');

-- Reviews for Art Exhibition (event_id = 9)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(9, 'Alice Johnson', 'The Art Exhibition was breathtaking, showcasing student creativity.'),
(9, 'David Brown', 'I was amazed by the diversity of art styles on display.'),
(9, 'Rachel Adams', 'Each piece had a unique story, beautifully explained by the artists.'),
(9, 'Tom Carter', 'The sculptures were particularly impressive and thought-provoking.'),
(9, 'Julia Kim', 'This exhibition was a feast for the eyes and the soul.'),
(9, 'Liam Wilson', 'The live painting session was the highlight for me.'),
(9, 'Sophia White', 'I appreciated how accessible and inclusive the exhibition was.'),
(9, 'Emma Davis', 'The photography section was incredibly inspiring.'),
(9, 'Noah Scott', 'I gained a deeper appreciation for modern art techniques.'),
(9, 'Mia Collins', 'I will definitely attend the next exhibition. The atmosphere was fantastic.');

-- Reviews for Tech Bootcamp (event_id = 10)
INSERT INTO reviews (event_id, reviewer_name, review_text)
VALUES
(10, 'Bob Smith', 'The Tech Bootcamp was intense and incredibly informative.'),
(10, 'Emily Green', 'I gained hands-on experience with coding techniques.'),
(10, 'John Walker', 'The instructors were very approachable and helpful.'),
(10, 'Olivia King', 'The capstone project helped me consolidate everything I learned.'),
(10, 'Michael Black', 'The bootcamp provided a solid foundation for my coding journey.'),
(10, 'Sophia Lee', 'I appreciated the focus on practical, real-world skills.'),
(10, 'Henry Carter', 'The group projects fostered collaboration and teamwork.'),
(10, 'Isabella White', 'This bootcamp gave me the confidence to pursue a tech career.'),
(10, 'Lucas Adams', 'The workshops were well-structured and engaging.'),
(10, 'Grace Taylor', 'I highly recommend this bootcamp to anyone new to coding.');

