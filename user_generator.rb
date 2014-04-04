require 'date'

module UserGenerator

  # Females first
  FEMALE_FIRST_NAMES = ['Mary', 'Patricia', 'Linda', 'Barbara', 'Elizabeth', 'Jennifer', 'Maria', 'Susan', 'Margaret', 'Dorothy', 'Lisa', 'Nancy', 'Karen', 'Betty', 'Helen', 'Sandra', 'Donna', 'Carol', 'Ruth', 'Sharon', 'Michelle', 'Laura', 'Sarah', 'Kimberly', 'Deborah', 'Jessica', 'Shirley', 'Cynthia', 'Angela', 'Melissa', 'Brenda', 'Amy', 'Anna', 'Rebecca', 'Virginia', 'Kathleen', 'Pamela', 'Martha', 'Debra', 'Amanda', 'Stephanie', 'Carolyn', 'Christine', 'Marie', 'Janet', 'Catherine', 'Frances', 'Ann', 'Joyce', 'Diane', 'Alice', 'Julie', 'Heather', 'Teresa', 'Doris', 'Gloria', 'Evelyn', 'Jean', 'Cheryl', 'Mildred', 'Katherine', 'Joan', 'Ashley', 'Judith', 'Rose', 'Janice', 'Kelly', 'Nicole', 'Judy', 'Christina', 'Kathy', 'Theresa', 'Beverly', 'Denise', 'Tammy', 'Irene', 'Jane', 'Lori', 'Rachel', 'Marilyn', 'Andrea', 'Kathryn', 'Louise', 'Sara', 'Anne', 'Jacqueline', 'Wanda', 'Bonnie', 'Julia', 'Ruby', 'Lois', 'Tina', 'Phyllis', 'Norma', 'Paula', 'Diana', 'Annie', 'Lillian', 'Emily', 'Robin', 'Peggy', 'Crystal', 'Gladys', 'Rita', 'Dawn', 'Connie', 'Florence', 'Tracy', 'Edna', 'Tiffany', 'Carmen', 'Rosa', 'Cindy', 'Grace', 'Wendy', 'Victoria', 'Edith', 'Kim', 'Sherry', 'Sylvia', 'Josephine', 'Thelma', 'Shannon', 'Sheila', 'Ethel', 'Ellen', 'Elaine', 'Marjorie', 'Carrie', 'Charlotte', 'Monica', 'Esther', 'Pauline', 'Emma', 'Juanita', 'Anita', 'Rhonda', 'Hazel', 'Amber', 'Eva', 'Debbie', 'April', 'Leslie', 'Clara', 'Lucille', 'Jamie', 'Joanne', 'Eleanor', 'Valerie', 'Danielle', 'Megan', 'Alicia', 'Suzanne', 'Michele', 'Gail', 'Bertha', 'Darlene', 'Veronica', 'Jill', 'Erin', 'Geraldine', 'Lauren', 'Cathy', 'Joann', 'Lorraine', 'Lynn', 'Sally', 'Regina', 'Erica', 'Beatrice', 'Dolores', 'Bernice', 'Audrey', 'Yvonne', 'Annette', 'June', 'Samantha', 'Marion', 'Dana', 'Stacy', 'Ana', 'Renee', 'Ida', 'Vivian', 'Roberta', 'Holly', 'Brittany', 'Melanie', 'Loretta', 'Yolanda', 'Jeanette', 'Laurie', 'Katie', 'Kristen', 'Vanessa', 'Alma', 'Sue', 'Elsie', 'Beth', 'Jeanne', 'Vicki', 'Carla', 'Tara', 'Rosemary', 'Eileen', 'Terri', 'Gertrude', 'Lucy', 'Tonya', 'Ella', 'Stacey', 'Wilma', 'Gina', 'Kristin', 'Jessie', 'Natalie', 'Agnes', 'Vera', 'Willie', 'Charlene', 'Bessie', 'Delores', 'Melinda', 'Pearl', 'Arlene', 'Maureen', 'Colleen', 'Allison', 'Tamara', 'Joy', 'Georgia', 'Constance', 'Lillie', 'Claudia', 'Jackie', 'Marcia', 'Tanya', 'Nellie', 'Minnie', 'Marlene', 'Heidi', 'Glenda', 'Lydia', 'Viola', 'Courtney', 'Marian', 'Stella', 'Caroline', 'Dora', 'Jo', 'Vickie', 'Mattie', 'Terry', 'Maxine', 'Irma', 'Mabel', 'Marsha', 'Myrtle', 'Lena', 'Christy', 'Deanna', 'Patsy', 'Hilda', 'Gwendolyn', 'Jennie', 'Nora', 'Margie', 'Nina', 'Cassandra', 'Leah', 'Penny', 'Kay', 'Priscilla', 'Naomi', 'Carole', 'Brandy', 'Olga', 'Billie', 'Dianne', 'Tracey', 'Leona', 'Jenny', 'Felicia', 'Sonia', 'Miriam', 'Velma', 'Becky', 'Bobbie', 'Violet', 'Kristina', 'Toni', 'Misty', 'Mae', 'Shelly', 'Daisy', 'Ramona', 'Sherri', 'Erika', 'Katrina', 'Claire', 'Lindsey', 'Lindsay', 'Geneva', 'Guadalupe', 'Belinda', 'Margarita', 'Sheryl', 'Cora', 'Faye', 'Ada', 'Natasha', 'Sabrina', 'Isabel', 'Marguerite', 'Hattie', 'Harriet', 'Molly', 'Cecilia', 'Kristi', 'Brandi', 'Blanche', 'Sandy', 'Rosie', 'Joanna', 'Iris', 'Eunice', 'Angie', 'Inez', 'Lynda', 'Madeline', 'Amelia', 'Alberta', 'Genevieve', 'Monique', 'Jodi', 'Janie', 'Maggie', 'Kayla', 'Sonya', 'Jan', 'Lee', 'Kristine', 'Candace', 'Fannie', 'Maryann', 'Opal', 'Alison', 'Yvette', 'Melody', 'Luz', 'Susie', 'Olivia', 'Flora', 'Shelley', 'Kristy', 'Mamie', 'Lula', 'Lola', 'Verna', 'Beulah', 'Antoinette', 'Candice', 'Juana', 'Jeannette', 'Pam', 'Kelli', 'Hannah', 'Whitney', 'Bridget', 'Karla', 'Celia', 'Latoya', 'Patty', 'Shelia', 'Gayle', 'Della', 'Vicky', 'Lynne', 'Sheri', 'Marianne', 'Kara', 'Jacquelyn', 'Erma', 'Blanca', 'Myra', 'Leticia', 'Pat', 'Krista', 'Roxanne', 'Angelica', 'Johnnie', 'Robyn', 'Francis', 'Adrienne', 'Rosalie', 'Alexandra', 'Brooke', 'Bethany', 'Sadie', 'Bernadette', 'Traci', 'Jody', 'Kendra', 'Jasmine', 'Nichole', 'Rachael', 'Chelsea', 'Mable', 'Ernestine', 'Muriel', 'Marcella', 'Elena', 'Krystal', 'Angelina', 'Nadine', 'Kari', 'Estelle', 'Dianna', 'Paulette', 'Lora', 'Mona', 'Doreen', 'Rosemarie', 'Angel', 'Desiree', 'Antonia', 'Hope', 'Ginger', 'Janis', 'Betsy', 'Christie', 'Freda', 'Mercedes', 'Meredith', 'Lynette', 'Teri', 'Cristina', 'Eula', 'Leigh', 'Meghan', 'Sophia', 'Eloise', 'Rochelle', 'Gretchen', 'Cecelia', 'Raquel', 'Henrietta', 'Alyssa', 'Jana', 'Kelley', 'Gwen', 'Kerry', 'Jenna', 'Tricia', 'Laverne', 'Olive', 'Alexis', 'Tasha', 'Silvia', 'Elvira', 'Casey', 'Delia', 'Sophie', 'Kate', 'Patti', 'Lorena', 'Kellie', 'Sonja', 'Lila', 'Lana', 'Darla', 'May', 'Mindy', 'Essie', 'Mandy', 'Lorene', 'Elsa', 'Josefina', 'Jeannie', 'Miranda', 'Dixie', 'Lucia', 'Marta', 'Faith', 'Lela', 'Johanna', 'Shari', 'Camille', 'Tami', 'Shawna', 'Elisa', 'Ebony', 'Melba', 'Ora', 'Nettie', 'Tabitha', 'Ollie', 'Jaime', 'Winifred', 'Kristie', 'Marina', 'Alisha', 'Aimee', 'Rena', 'Myrna', 'Marla', 'Tammie', 'Latasha', 'Bonita', 'Patrice', 'Ronda', 'Sherrie', 'Addie', 'Francine', 'Deloris', 'Stacie', 'Adriana', 'Cheri', 'Shelby', 'Abigail', 'Celeste', 'Jewel', 'Cara', 'Adele', 'Rebekah', 'Lucinda', 'Dorthy', 'Chris', 'Effie', 'Trina', 'Reba', 'Shawn', 'Sallie', 'Aurora', 'Lenora', 'Etta', 'Lottie', 'Kerri', 'Trisha', 'Nikki', 'Estella', 'Francisca', 'Josie', 'Tracie', 'Marissa', 'Karin', 'Brittney', 'Janelle', 'Lourdes', 'Laurel', 'Helene', 'Fern', 'Elva', 'Corinne', 'Kelsey', 'Ina', 'Bettie', 'Elisabeth', 'Aida', 'Caitlin', 'Ingrid', 'Iva', 'Eugenia', 'Christa', 'Goldie', 'Cassie', 'Maude', 'Jenifer', 'Therese', 'Frankie', 'Dena', 'Lorna', 'Janette', 'Latonya', 'Candy', 'Morgan', 'Consuelo', 'Tamika', 'Rosetta', 'Debora', 'Cherie', 'Polly', 'Dina', 'Jewell', 'Fay', 'Jillian', 'Dorothea', 'Nell', 'Trudy', 'Esperanza', 'Patrica', 'Kimberley', 'Shanna', 'Helena', 'Carolina', 'Cleo', 'Stefanie', 'Rosario', 'Ola', 'Janine', 'Mollie', 'Lupe', 'Alisa', 'Lou', 'Maribel', 'Susanne', 'Bette', 'Susana', 'Elise', 'Cecile', 'Isabelle', 'Lesley', 'Jocelyn', 'Paige', 'Joni', 'Rachelle', 'Leola', 'Daphne', 'Alta', 'Ester', 'Petra', 'Graciela', 'Imogene', 'Jolene', 'Keisha', 'Lacey', 'Glenna', 'Gabriela', 'Keri', 'Ursula', 'Lizzie', 'Kirsten', 'Shana', 'Adeline', 'Mayra', 'Jayne', 'Jaclyn', 'Gracie', 'Sondra', 'Carmela', 'Marisa', 'Rosalind', 'Charity', 'Tonia', 'Beatriz', 'Marisol', 'Clarice', 'Jeanine', 'Sheena', 'Angeline', 'Frieda', 'Lily', 'Robbie', 'Shauna', 'Millie', 'Claudette', 'Cathleen', 'Angelia', 'Gabrielle', 'Autumn', 'Katharine', 'Summer', 'Jodie', 'Staci', 'Lea', 'Christi', 'Jimmie', 'Justine', 'Elma', 'Luella', 'Margret', 'Dominique', 'Socorro', 'Rene', 'Martina', 'Margo', 'Mavis', 'Callie', 'Bobbi', 'Maritza', 'Lucile', 'Leanne', 'Jeannine', 'Deana', 'Aileen', 'Lorie', 'Ladonna', 'Willa', 'Manuela', 'Gale', 'Selma', 'Dolly', 'Sybil', 'Abby', 'Lara', 'Dale', 'Ivy', 'Dee', 'Winnie', 'Marcy', 'Luisa', 'Jeri', 'Magdalena', 'Ofelia', 'Meagan', 'Audra', 'Matilda', 'Leila', 'Cornelia', 'Bianca', 'Simone', 'Bettye', 'Randi', 'Virgie', 'Latisha', 'Barbra', 'Georgina', 'Eliza', 'Leann', 'Bridgette', 'Rhoda', 'Haley', 'Adela', 'Nola', 'Bernadine', 'Flossie', 'Ila', 'Greta', 'Ruthie', 'Nelda', 'Minerva', 'Lilly', 'Terrie', 'Letha', 'Hilary', 'Estela', 'Valarie', 'Brianna', 'Rosalyn', 'Earline', 'Catalina', 'Ava', 'Mia', 'Clarissa', 'Lidia', 'Corrine', 'Alexandria', 'Concepcion', 'Tia', 'Sharron', 'Rae', 'Dona', 'Ericka', 'Jami', 'Elnora', 'Chandra', 'Lenore', 'Neva', 'Marylou', 'Melisa', 'Tabatha', 'Serena', 'Avis', 'Allie', 'Sofia', 'Jeanie', 'Odessa', 'Nannie', 'Harriett', 'Loraine', 'Penelope', 'Milagros', 'Emilia', 'Benita', 'Allyson', 'Ashlee', 'Tania', 'Tommie', 'Esmeralda', 'Karina', 'Eve', 'Pearlie', 'Zelma', 'Malinda', 'Noreen', 'Tameka', 'Saundra', 'Hillary', 'Amie', 'Althea', 'Rosalinda', 'Jordan', 'Lilia', 'Alana', 'Gay', 'Clare', 'Alejandra', 'Elinor', 'Michael', 'Lorrie', 'Jerri', 'Darcy', 'Earnestine', 'Carmella', 'Taylor', 'Noemi', 'Marcie', 'Liza', 'Annabelle', 'Louisa', 'Earlene', 'Mallory', 'Carlene', 'Nita', 'Selena', 'Tanisha', 'Katy', 'Julianne', 'John', 'Lakisha', 'Edwina', 'Maricela', 'Margery', 'Kenya', 'Dollie', 'Roxie', 'Roslyn', 'Kathrine', 'Nanette', 'Charmaine', 'Lavonne', 'Ilene', 'Kris', 'Tammi', 'Suzette', 'Corine', 'Kaye', 'Jerry', 'Merle', 'Chrystal', 'Lina', 'Deanne', 'Lilian', 'Juliana', 'Aline', 'Luann', 'Kasey', 'Maryanne', 'Evangeline', 'Colette', 'Melva', 'Lawanda', 'Yesenia', 'Nadia', 'Madge', 'Kathie', 'Eddie', 'Ophelia', 'Valeria', 'Nona', 'Mitzi', 'Mari', 'Georgette', 'Claudine', 'Fran', 'Alissa', 'Roseann', 'Lakeisha', 'Susanna', 'Reva', 'Deidre', 'Chasity', 'Sheree', 'Carly', 'James', 'Elvia', 'Alyce', 'Deirdre', 'Gena', 'Briana', 'Araceli', 'Katelyn', 'Rosanne', 'Wendi', 'Tessa', 'Berta', 'Marva', 'Imelda', 'Marietta', 'Marci', 'Leonor', 'Arline', 'Sasha', 'Madelyn', 'Janna', 'Juliette', 'Deena', 'Aurelia', 'Josefa', 'Augusta', 'Liliana', 'Young', 'Christian', 'Lessie', 'Amalia', 'Savannah', 'Anastasia', 'Vilma', 'Natalia', 'Rosella', 'Lynnette', 'Corina', 'Alfreda', 'Leanna', 'Carey', 'Amparo', 'Coleen', 'Tamra', 'Aisha', 'Wilda', 'Karyn', 'Cherry', 'Queen', 'Maura', 'Mai', 'Evangelina', 'Rosanna', 'Hallie', 'Erna', 'Enid', 'Mariana', 'Lacy', 'Juliet', 'Jacklyn', 'Freida', 'Madeleine', 'Mara', 'Hester', 'Cathryn', 'Lelia', 'Casandra', 'Bridgett', 'Angelita', 'Jannie', 'Dionne', 'Annmarie', 'Katina', 'Beryl', 'Phoebe', 'Millicent', 'Katheryn', 'Diann', 'Carissa', 'Maryellen', 'Liz', 'Lauri', 'Helga', 'Gilda', 'Adrian', 'Rhea', 'Marquita', 'Hollie', 'Tisha', 'Tamera', 'Angelique', 'Francesca', 'Britney', 'Kaitlin', 'Lolita', 'Florine', 'Rowena', 'Reyna', 'Twila', 'Fanny', 'Janell', 'Ines', 'Concetta', 'Bertie', 'Alba', 'Brigitte', 'Alyson', 'Vonda', 'Pansy', 'Elba', 'Noelle', 'Letitia', 'Kitty', 'Deann', 'Brandie', 'Louella', 'Leta', 'Felecia', 'Sharlene', 'Lesa', 'Beverley', 'Robert', 'Isabella', 'Herminia', 'Terra', 'Celina']
  MALE_FIRST_NAMES = ['Aaron', 'Abdul', 'Abe', 'Abel', 'Abraham', 'Adalberto', 'Adam', 'Adolfo', 'Adolph', 'Adrian', 'Agustin', 'Ahmad', 'Ahmed', 'Al', 'Alan', 'Albert', 'Alberto', 'Alden', 'Aldo', 'Alec', 'Alejandro', 'Alex', 'Alexander', 'Alexis', 'Alfonso', 'Alfonzo', 'Alfred', 'Alfredo', 'Ali', 'Allan', 'Allen', 'Alonso', 'Alonzo', 'Alphonse', 'Alphonso', 'Alton', 'Alva', 'Alvaro', 'Alvin', 'Amado', 'Ambrose', 'Amos', 'Anderson', 'Andre', 'Andrea', 'Andreas', 'Andres', 'Andrew', 'Andy', 'Angel', 'Angelo', 'Anibal', 'Anthony', 'Antione', 'Antoine', 'Anton', 'Antone', 'Antonia', 'Antonio', 'Antony', 'Antwan', 'Archie', 'Arden', 'Ariel', 'Arlen', 'Arlie', 'Armand', 'Armando', 'Arnold', 'Arnoldo', 'Arnulfo', 'Aron', 'Arron', 'Art', 'Arthur', 'Arturo', 'Asa', 'Ashley', 'Aubrey', 'August', 'Augustine', 'Augustus', 'Aurelio', 'Austin', 'Avery', 'Barney', 'Barrett', 'Barry', 'Bart', 'Barton', 'Basil', 'Beau', 'Ben', 'Benedict', 'Benito', 'Benjamin', 'Bennett', 'Bennie', 'Benny', 'Benton', 'Bernard', 'Bernardo', 'Bernie', 'Berry', 'Bert', 'Bertram', 'Bill', 'Billie', 'Billy', 'Blaine', 'Blair', 'Blake', 'Bo', 'Bob', 'Bobbie', 'Bobby', 'Booker', 'Boris', 'Boyce', 'Boyd', 'Brad', 'Bradford', 'Bradley', 'Bradly', 'Brady', 'Brain', 'Branden', 'Brandon', 'Brant', 'Brendan', 'Brendon', 'Brent', 'Brenton', 'Bret', 'Brett', 'Brian', 'Brice', 'Britt', 'Brock', 'Broderick', 'Brooks', 'Bruce', 'Bruno', 'Bryan', 'Bryant', 'Bryce', 'Bryon', 'Buck', 'Bud', 'Buddy', 'Buford', 'Burl', 'Burt', 'Burton', 'Buster', 'Byron', 'Caleb', 'Calvin', 'Cameron', 'Carey', 'Carl', 'Carlo', 'Carlos', 'Carlton', 'Carmelo', 'Carmen', 'Carmine', 'Carol', 'Carrol', 'Carroll', 'Carson', 'Carter', 'Cary', 'Casey', 'Cecil', 'Cedric', 'Cedrick', 'Cesar', 'Chad', 'Chadwick', 'Chance', 'Chang', 'Charles', 'Charley', 'Charlie', 'Chas', 'Chase', 'Chauncey', 'Chester', 'Chet', 'Chi', 'Chong', 'Chris', 'Christian', 'Christoper', 'Christopher', 'Chuck', 'Chung', 'Clair', 'Clarence', 'Clark', 'Claud', 'Claude', 'Claudio', 'Clay', 'Clayton', 'Clement', 'Clemente', 'Cleo', 'Cletus', 'Cleveland', 'Cliff', 'Clifford', 'Clifton', 'Clint', 'Clinton', 'Clyde', 'Cody', 'Colby', 'Cole', 'Coleman', 'Colin', 'Collin', 'Colton', 'Columbus', 'Connie', 'Conrad', 'Cordell', 'Corey', 'Cornelius', 'Cornell', 'Cortez', 'Cory', 'Courtney', 'Coy', 'Craig', 'Cristobal', 'Cristopher', 'Cruz', 'Curt', 'Curtis', 'Cyril', 'Cyrus', 'Dale', 'Dallas', 'Dalton', 'Damian', 'Damien', 'Damion', 'Damon', 'Dan', 'Dana', 'Dane', 'Danial', 'Daniel', 'Danilo', 'Dannie', 'Danny', 'Dante', 'Darell', 'Daren', 'Darin', 'Dario', 'Darius', 'Darnell', 'Daron', 'Darrel', 'Darrell', 'Darren', 'Darrick', 'Darrin', 'Darron', 'Darryl', 'Darwin', 'Daryl', 'Dave', 'David', 'Davis', 'Dean', 'Deandre', 'Deangelo', 'Dee', 'Del', 'Delbert', 'Delmar', 'Delmer', 'Demarcus', 'Demetrius', 'Denis', 'Dennis', 'Denny', 'Denver', 'Deon', 'Derek', 'Derick', 'Derrick', 'Deshawn', 'Desmond', 'Devin', 'Devon', 'Dewayne', 'Dewey', 'Dewitt', 'Dexter', 'Dick', 'Diego', 'Dillon', 'Dino', 'Dion', 'Dirk', 'Domenic', 'Domingo', 'Dominic', 'Dominick', 'Dominique', 'Don', 'Donald', 'Dong', 'Donn', 'Donnell', 'Donnie', 'Donny', 'Donovan', 'Donte', 'Dorian', 'Dorsey', 'Doug', 'Douglas', 'Douglass', 'Doyle', 'Drew', 'Duane', 'Dudley', 'Duncan', 'Dustin', 'Dusty', 'Dwain', 'Dwayne', 'Dwight', 'Dylan', 'Earl', 'Earle', 'Earnest', 'Ed', 'Eddie', 'Eddy', 'Edgar', 'Edgardo', 'Edison', 'Edmond', 'Edmund', 'Edmundo', 'Eduardo', 'Edward', 'Edwardo', 'Edwin', 'Efrain', 'Efren', 'Elbert', 'Elden', 'Eldon', 'Eldridge', 'Eli', 'Elias', 'Elijah', 'Eliseo', 'Elisha', 'Elliot', 'Elliott', 'Ellis', 'Ellsworth', 'Elmer', 'Elmo', 'Eloy', 'Elroy', 'Elton', 'Elvin', 'Elvis', 'Elwood', 'Emanuel', 'Emerson', 'Emery', 'Emil', 'Emile', 'Emilio', 'Emmanuel', 'Emmett', 'Emmitt', 'Emory', 'Enoch', 'Enrique', 'Erasmo', 'Eric', 'Erich', 'Erick', 'Erik', 'Erin', 'Ernest', 'Ernesto', 'Ernie', 'Errol', 'Ervin', 'Erwin', 'Esteban', 'Ethan', 'Eugene', 'Eugenio', 'Eusebio', 'Evan', 'Everett', 'Everette', 'Ezekiel', 'Ezequiel', 'Ezra', 'Fabian', 'Faustino', 'Fausto', 'Federico', 'Felipe', 'Felix', 'Felton', 'Ferdinand', 'Fermin', 'Fernando', 'Fidel', 'Filiberto', 'Fletcher', 'Florencio', 'Florentino', 'Floyd', 'Forest', 'Forrest', 'Foster', 'Frances', 'Francesco', 'Francis', 'Francisco', 'Frank', 'Frankie', 'Franklin', 'Franklyn', 'Fred', 'Freddie', 'Freddy', 'Frederic', 'Frederick', 'Fredric', 'Fredrick', 'Freeman', 'Fritz', 'Gabriel', 'Gail', 'Gale', 'Galen', 'Garfield', 'Garland', 'Garret', 'Garrett', 'Garry', 'Garth', 'Gary', 'Gaston', 'Gavin', 'Gayle', 'Gaylord', 'Genaro', 'Gene', 'Geoffrey', 'George', 'Gerald', 'Geraldo', 'Gerard', 'Gerardo', 'German', 'Gerry', 'Gil', 'Gilbert', 'Gilberto', 'Gino', 'Giovanni', 'Giuseppe', 'Glen', 'Glenn', 'Gonzalo', 'Gordon', 'Grady', 'Graham', 'Graig', 'Grant', 'Granville', 'Greg', 'Gregg', 'Gregorio', 'Gregory', 'Grover', 'Guadalupe', 'Guillermo', 'Gus', 'Gustavo', 'Guy', 'Hai', 'Hal', 'Hank', 'Hans', 'Harlan', 'Harland', 'Harley', 'Harold', 'Harris', 'Harrison', 'Harry', 'Harvey', 'Hassan', 'Hayden', 'Haywood', 'Heath', 'Hector', 'Henry', 'Herb', 'Herbert', 'Heriberto', 'Herman', 'Herschel', 'Hershel', 'Hilario', 'Hilton', 'Hipolito', 'Hiram', 'Hobert', 'Hollis', 'Homer', 'Hong', 'Horace', 'Horacio', 'Hosea', 'Houston', 'Howard', 'Hoyt', 'Hubert', 'Huey', 'Hugh', 'Hugo', 'Humberto', 'Hung', 'Hunter', 'Hyman', 'Ian', 'Ignacio', 'Ike', 'Ira', 'Irvin', 'Irving', 'Irwin', 'Isaac', 'Isaiah', 'Isaias', 'Isiah', 'Isidro', 'Ismael', 'Israel', 'Isreal', 'Issac', 'Ivan', 'Ivory', 'Jacinto', 'Jack', 'Jackie', 'Jackson', 'Jacob', 'Jacques', 'Jae', 'Jaime', 'Jake', 'Jamaal', 'Jamal', 'Jamar', 'Jame', 'Jamel', 'James', 'Jamey', 'Jamie', 'Jamison', 'Jan', 'Jared', 'Jarod', 'Jarred', 'Jarrett', 'Jarrod', 'Jarvis', 'Jason', 'Jasper', 'Javier', 'Jay', 'Jayson', 'Jc', 'Jean', 'Jed', 'Jeff', 'Jefferey', 'Jefferson', 'Jeffery', 'Jeffrey', 'Jeffry', 'Jerald', 'Jeramy', 'Jere', 'Jeremiah', 'Jeremy', 'Jermaine', 'Jerold', 'Jerome', 'Jeromy', 'Jerrell', 'Jerrod', 'Jerrold', 'Jerry', 'Jess', 'Jesse', 'Jessie', 'Jesus', 'Jewel', 'Jewell', 'Jim', 'Jimmie', 'Jimmy', 'Joan', 'Joaquin', 'Jody', 'Joe', 'Joel', 'Joesph', 'Joey', 'John', 'Johnathan', 'Johnathon', 'Johnie', 'Johnnie', 'Johnny', 'Johnson', 'Jon', 'Jonah', 'Jonas', 'Jonathan', 'Jonathon', 'Jordan', 'Jordon', 'Jorge', 'Jose', 'Josef', 'Joseph', 'Josh', 'Joshua', 'Josiah', 'Jospeh', 'Josue', 'Juan', 'Jude', 'Judson', 'Jules', 'Julian', 'Julio', 'Julius', 'Junior', 'Justin', 'Kareem', 'Karl', 'Kasey', 'Keenan', 'Keith', 'Kelley', 'Kelly', 'Kelvin', 'Ken', 'Kendall', 'Kendrick', 'Keneth', 'Kenneth', 'Kennith', 'Kenny', 'Kent', 'Kenton', 'Kermit', 'Kerry', 'Keven', 'Kevin', 'Kieth', 'Kim', 'King', 'Kip', 'Kirby', 'Kirk', 'Korey', 'Kory', 'Kraig', 'Kris', 'Kristofer', 'Kristopher', 'Kurt', 'Kurtis', 'Kyle', 'Lacy', 'Lamar', 'Lamont', 'Lance', 'Landon', 'Lane', 'Lanny', 'Larry', 'Lauren', 'Laurence', 'Lavern', 'Laverne', 'Lawerence', 'Lawrence', 'Lazaro', 'Leandro', 'Lee', 'Leif', 'Leigh', 'Leland', 'Lemuel', 'Len', 'Lenard', 'Lenny', 'Leo', 'Leon', 'Leonard', 'Leonardo', 'Leonel', 'Leopoldo', 'Leroy', 'Les', 'Lesley', 'Leslie', 'Lester', 'Levi', 'Lewis', 'Lincoln', 'Lindsay', 'Lindsey', 'Lino', 'Linwood', 'Lionel', 'Lloyd', 'Logan', 'Lon', 'Long', 'Lonnie', 'Lonny', 'Loren', 'Lorenzo', 'Lou', 'Louie', 'Louis', 'Lowell', 'Loyd', 'Lucas', 'Luciano', 'Lucien', 'Lucio', 'Lucius', 'Luigi', 'Luis', 'Luke', 'Lupe', 'Luther', 'Lyle', 'Lyman', 'Lyndon', 'Lynn', 'Lynwood', 'Mac', 'Mack', 'Major', 'Malcolm', 'Malcom', 'Malik', 'Man', 'Manual', 'Manuel', 'Marc', 'Marcel', 'Marcelino', 'Marcellus', 'Marcelo', 'Marco', 'Marcos', 'Marcus', 'Margarito', 'Maria', 'Mariano', 'Mario', 'Marion', 'Mark', 'Markus', 'Marlin', 'Marlon', 'Marquis', 'Marshall', 'Martin', 'Marty', 'Marvin', 'Mary', 'Mason', 'Mathew', 'Matt', 'Matthew', 'Maurice', 'Mauricio', 'Mauro', 'Max', 'Maximo', 'Maxwell', 'Maynard', 'Mckinley', 'Mel', 'Melvin', 'Merle', 'Merlin', 'Merrill', 'Mervin', 'Micah', 'Michael', 'Michal', 'Michale', 'Micheal', 'Michel', 'Mickey', 'Miguel', 'Mike', 'Mikel', 'Milan', 'Miles', 'Milford', 'Millard', 'Milo', 'Milton', 'Minh', 'Miquel', 'Mitch', 'Mitchel', 'Mitchell', 'Modesto', 'Mohamed', 'Mohammad', 'Mohammed', 'Moises', 'Monroe', 'Monte', 'Monty', 'Morgan', 'Morris', 'Morton', 'Mose', 'Moses', 'Moshe', 'Murray', 'Myles', 'Myron', 'Napoleon', 'Nathan', 'Nathanael', 'Nathanial', 'Nathaniel', 'Neal', 'Ned', 'Neil', 'Nelson', 'Nestor', 'Neville', 'Newton', 'Nicholas', 'Nick', 'Nickolas', 'Nicky', 'Nicolas', 'Nigel', 'Noah', 'Noble', 'Noe', 'Noel', 'Nolan', 'Norbert', 'Norberto', 'Norman', 'Normand', 'Norris', 'Numbers', 'Octavio', 'Odell', 'Odis', 'Olen', 'Olin', 'Oliver', 'Ollie', 'Omar', 'Omer', 'Oren', 'Orlando', 'Orval', 'Orville', 'Oscar', 'Osvaldo', 'Oswaldo', 'Otha', 'Otis', 'Otto', 'Owen', 'Pablo', 'Palmer', 'Paris', 'Parker', 'Pasquale', 'Pat', 'Patricia', 'Patrick', 'Paul', 'Pedro', 'Percy', 'Perry', 'Pete', 'Peter', 'Phil', 'Philip', 'Phillip', 'Pierre', 'Porfirio', 'Porter', 'Preston', 'Prince', 'Quentin', 'Quincy', 'Quinn', 'Quintin', 'Quinton', 'Rafael', 'Raleigh', 'Ralph', 'Ramiro', 'Ramon', 'Randal', 'Randall', 'Randell', 'Randolph', 'Randy', 'Raphael', 'Rashad', 'Raul', 'Ray', 'Rayford', 'Raymon', 'Raymond', 'Raymundo', 'Reed', 'Refugio', 'Reggie', 'Reginald', 'Reid', 'Reinaldo', 'Renaldo', 'Renato', 'Rene', 'Reuben', 'Rex', 'Rey', 'Reyes', 'Reynaldo', 'Rhett', 'Ricardo', 'Rich', 'Richard', 'Richie', 'Rick', 'Rickey', 'Rickie', 'Ricky', 'Rico', 'Riley', 'Rob', 'Robbie', 'Robby', 'Robert', 'Roberto', 'Robin', 'Robt', 'Rocco', 'Rocky', 'Rod', 'Roderick', 'Rodger', 'Rodney', 'Rodolfo', 'Rodrick', 'Rodrigo', 'Roger', 'Roland', 'Rolando', 'Rolland', 'Roman', 'Romeo', 'Ron', 'Ronald', 'Ronnie', 'Ronny', 'Roosevelt', 'Rory', 'Rosario', 'Roscoe', 'Rosendo', 'Ross', 'Roy', 'Royal', 'Royce', 'Ruben', 'Rubin', 'Rudolf', 'Rudolph', 'Rudy', 'Rueben', 'Rufus', 'Rupert', 'Russ', 'Russel', 'Russell', 'Rusty', 'Ryan', 'Sal', 'Salvador', 'Salvatore', 'Sam', 'Sammie', 'Sammy', 'Samual', 'Samuel', 'Sandy', 'Sanford', 'Sang', 'Santiago', 'Santo', 'Santos', 'Saul', 'Scot', 'Scott', 'Scottie', 'Scotty', 'Sean', 'Sebastian', 'Sergio', 'Seth', 'Seymour', 'Shad', 'Shane', 'Shannon', 'Shaun', 'Shawn', 'Shayne', 'Shelby', 'Sheldon', 'Shelton', 'Sherman', 'Sherwood', 'Shirley', 'Shon', 'Sid', 'Sidney', 'Silas', 'Simon', 'Sol', 'Solomon', 'Son', 'Sonny', 'Spencer', 'Stacey', 'Stacy', 'Stan', 'Stanford', 'Stanley', 'Stanton', 'Stefan', 'Stephan', 'Stephen', 'Sterling', 'Steve', 'Steven', 'Stevie', 'Stewart', 'Stuart', 'Sung', 'Sydney', 'Sylvester', 'Tad', 'Tanner', 'Taylor', 'Ted', 'Teddy', 'Teodoro', 'Terence', 'Terrance', 'Terrell', 'Terrence', 'Terry', 'Thad', 'Thaddeus', 'Thanh', 'Theo', 'Theodore', 'Theron', 'Thomas', 'Thurman', 'Tim', 'Timmy', 'Timothy', 'Titus', 'Tobias', 'Toby', 'Tod', 'Todd', 'Tom', 'Tomas', 'Tommie', 'Tommy', 'Toney', 'Tony', 'Tory', 'Tracey', 'Tracy', 'Travis', 'Trent', 'Trenton', 'Trevor', 'Trey', 'Trinidad', 'Tristan', 'Troy', 'Truman', 'Tuan', 'Ty', 'Tyler', 'Tyree', 'Tyrell', 'Tyron', 'Tyrone', 'Tyson', 'Ulysses', 'Val', 'Valentin', 'Valentine', 'Van', 'Vance', 'Vaughn', 'Vern', 'Vernon', 'Vicente', 'Victor', 'Vince', 'Vincent', 'Vincenzo', 'Virgil', 'Virgilio', 'Vito', 'Von', 'Wade', 'Waldo', 'Walker', 'Wallace', 'Wally', 'Walter', 'Walton', 'Ward', 'Warner', 'Warren', 'Waylon', 'Wayne', 'Weldon', 'Wendell', 'Werner', 'Wes', 'Wesley', 'Weston', 'Whitney', 'Wilber', 'Wilbert', 'Wilbur', 'Wilburn', 'Wiley', 'Wilford', 'Wilfred', 'Wilfredo', 'Will', 'Willard', 'William', 'Williams', 'Willian', 'Willie', 'Willis', 'Willy', 'Wilmer', 'Wilson', 'Wilton', 'Winford', 'Winfred', 'Winston', 'Wm', 'Woodrow', 'Wyatt', 'Xavier', 'Yong', 'Young', 'Zachariah', 'Zachary', 'Zachery', 'Zack', 'Zackary']

  SURNAMES = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor', 'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Martinez', 'Robinson', 'Clark', 'Rodriguez', 'Lewis', 'Lee', 'Walker', 'Hall', 'Allen', 'Young', 'Hernandez', 'King', 'Wright', 'Lopez', 'Hill', 'Scott', 'Green', 'Adams', 'Baker', 'Gonzalez', 'Nelson', 'Carter', 'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker', 'Evans', 'Edwards', 'Collins', 'Stewart', 'Sanchez', 'Morris', 'Rogers', 'Reed', 'Cook', 'Morgan', 'Bell', 'Murphy', 'Bailey', 'Rivera', 'Cooper', 'Richardson', 'Cox', 'Howard', 'Ward', 'Torres', 'Peterson', 'Gray', 'Ramirez', 'James', 'Watson', 'Brooks', 'Kelly', 'Sanders', 'Price', 'Bennett', 'Wood', 'Barnes', 'Ross', 'Henderson', 'Coleman', 'Jenkins', 'Perry', 'Powell', 'Long', 'Patterson', 'Hughes', 'Flores', 'Washington', 'Butler', 'Simmons', 'Foster', 'Gonzales', 'Bryant', 'Alexander', 'Russell', 'Griffin', 'Diaz', 'Hayes', 'Myers', 'Ford', 'Hamilton', 'Graham', 'Sullivan', 'Wallace', 'Woods', 'Cole', 'West', 'Jordan', 'Owens', 'Reynolds', 'Fisher', 'Ellis', 'Harrison', 'Gibson', 'Mcdonald', 'Cruz', 'Marshall', 'Ortiz', 'Gomez', 'Murray', 'Freeman', 'Wells', 'Webb', 'Simpson', 'Stevens', 'Tucker', 'Porter', 'Hunter', 'Hicks', 'Crawford', 'Henry', 'Boyd', 'Mason', 'Morales', 'Kennedy', 'Warren', 'Dixon', 'Ramos', 'Reyes', 'Burns', 'Gordon', 'Shaw', 'Holmes', 'Rice', 'Robertson', 'Hunt', 'Black', 'Daniels', 'Palmer', 'Mills', 'Nichols', 'Grant', 'Knight', 'Ferguson', 'Rose', 'Stone', 'Hawkins', 'Dunn', 'Perkins', 'Hudson', 'Spencer', 'Gardner', 'Stephens', 'Payne', 'Pierce', 'Berry', 'Matthews', 'Arnold', 'Wagner', 'Willis', 'Ray', 'Watkins', 'Olson', 'Carroll', 'Duncan', 'Snyder', 'Hart', 'Cunningham', 'Bradley', 'Lane', 'Andrews', 'Ruiz', 'Harper', 'Fox', 'Riley', 'Armstrong', 'Carpenter', 'Weaver', 'Greene', 'Lawrence', 'Elliott', 'Chavez', 'Sims', 'Austin', 'Peters', 'Kelley', 'Franklin', 'Lawson', 'Fields', 'Gutierrez', 'Ryan', 'Schmidt', 'Carr', 'Vasquez', 'Castillo', 'Wheeler', 'Chapman', 'Oliver', 'Montgomery', 'Richards', 'Williamson', 'Johnston', 'Banks', 'Meyer', 'Bishop', 'Mccoy', 'Howell', 'Alvarez', 'Morrison', 'Hansen', 'Fernandez', 'Garza', 'Harvey', 'Little', 'Burton', 'Stanley', 'Nguyen', 'George', 'Jacobs', 'Reid', 'Kim', 'Fuller', 'Lynch', 'Dean', 'Gilbert', 'Garrett', 'Romero', 'Welch', 'Larson', 'Frazier', 'Burke', 'Hanson', 'Day', 'Mendoza', 'Moreno', 'Bowman', 'Medina', 'Fowler', 'Brewer', 'Hoffman', 'Carlson', 'Silva', 'Pearson', 'Holland', 'Douglas', 'Fleming', 'Jensen', 'Vargas', 'Byrd', 'Davidson', 'Hopkins', 'May', 'Terry', 'Herrera', 'Wade', 'Soto', 'Walters', 'Curtis', 'Neal', 'Caldwell', 'Lowe', 'Jennings', 'Barnett', 'Graves', 'Jimenez', 'Horton', 'Shelton', 'Barrett', 'Obrien', 'Castro', 'Sutton', 'Gregory', 'Mckinney', 'Lucas', 'Miles', 'Craig', 'Rodriquez', 'Chambers', 'Holt', 'Lambert', 'Fletcher', 'Watts', 'Bates', 'Hale', 'Rhodes', 'Pena', 'Beck', 'Newman', 'Haynes', 'Mcdaniel', 'Mendez', 'Bush', 'Vaughn', 'Parks', 'Dawson', 'Santiago', 'Norris', 'Hardy', 'Love', 'Steele', 'Curry', 'Powers', 'Schultz', 'Barker', 'Guzman', 'Page', 'Munoz', 'Ball', 'Keller', 'Chandler', 'Weber', 'Leonard', 'Walsh', 'Lyons', 'Ramsey', 'Wolfe', 'Schneider', 'Mullins', 'Benson', 'Sharp', 'Bowen', 'Daniel', 'Barber', 'Cummings', 'Hines', 'Baldwin', 'Griffith', 'Valdez', 'Hubbard', 'Salazar', 'Reeves', 'Warner', 'Stevenson', 'Burgess', 'Santos', 'Tate', 'Cross', 'Garner', 'Mann', 'Mack', 'Moss', 'Thornton', 'Dennis', 'Mcgee', 'Farmer', 'Delgado', 'Aguilar', 'Vega', 'Glover', 'Manning', 'Cohen', 'Harmon', 'Rodgers', 'Robbins', 'Newton', 'Todd', 'Blair', 'Higgins', 'Ingram', 'Reese', 'Cannon', 'Strickland', 'Townsend', 'Potter', 'Goodwin', 'Walton', 'Rowe', 'Hampton', 'Ortega', 'Patton', 'Swanson', 'Joseph', 'Francis', 'Goodman', 'Maldonado', 'Yates', 'Becker', 'Erickson', 'Hodges', 'Rios', 'Conner', 'Adkins', 'Webster', 'Norman', 'Malone', 'Hammond', 'Flowers', 'Cobb', 'Moody', 'Quinn', 'Blake', 'Maxwell', 'Pope', 'Floyd', 'Osborne', 'Paul', 'Mccarthy', 'Guerrero', 'Lindsey', 'Estrada', 'Sandoval', 'Gibbs', 'Tyler', 'Gross', 'Fitzgerald', 'Stokes', 'Doyle', 'Sherman', 'Saunders', 'Wise', 'Colon', 'Gill', 'Alvarado', 'Greer', 'Padilla', 'Simon', 'Waters', 'Nunez', 'Ballard', 'Schwartz', 'Mcbride', 'Houston', 'Christensen', 'Klein', 'Pratt', 'Briggs', 'Parsons', 'Mclaughlin', 'Zimmerman', 'French', 'Buchanan', 'Moran', 'Copeland', 'Roy', 'Pittman', 'Brady', 'Mccormick', 'Holloway', 'Brock', 'Poole', 'Frank', 'Logan', 'Owen', 'Bass', 'Marsh', 'Drake', 'Wong', 'Jefferson', 'Park', 'Morton', 'Abbott', 'Sparks', 'Patrick', 'Norton', 'Huff', 'Clayton', 'Massey', 'Lloyd', 'Figueroa', 'Carson', 'Bowers', 'Roberson', 'Barton', 'Tran', 'Lamb', 'Harrington', 'Casey', 'Boone', 'Cortez', 'Clarke', 'Mathis', 'Singleton', 'Wilkins', 'Cain', 'Bryan', 'Underwood', 'Hogan', 'Mckenzie', 'Collier', 'Luna', 'Phelps', 'Mcguire', 'Allison', 'Bridges', 'Wilkerson', 'Nash', 'Summers', 'Atkins', 'Wilcox', 'Pitts', 'Conley', 'Marquez', 'Burnett', 'Richard', 'Cochran', 'Chase', 'Davenport', 'Hood', 'Gates', 'Clay', 'Ayala', 'Sawyer', 'Roman', 'Vazquez', 'Dickerson', 'Hodge', 'Acosta', 'Flynn', 'Espinoza', 'Nicholson', 'Monroe', 'Wolf', 'Morrow', 'Kirk', 'Randall', 'Anthony', 'Whitaker', 'Oconnor', 'Skinner', 'Ware', 'Molina', 'Kirby', 'Huffman', 'Bradford', 'Charles', 'Gilmore', 'Dominguez', 'Oneal', 'Bruce', 'Lang', 'Combs', 'Kramer', 'Heath', 'Hancock', 'Gallagher', 'Gaines', 'Shaffer', 'Short', 'Wiggins', 'Mathews', 'Mcclain', 'Fischer', 'Wall', 'Small', 'Melton', 'Hensley', 'Bond', 'Dyer', 'Cameron', 'Grimes', 'Contreras', 'Christian', 'Wyatt', 'Baxter', 'Snow', 'Mosley', 'Shepherd', 'Larsen', 'Hoover', 'Beasley', 'Glenn', 'Petersen', 'Whitehead', 'Meyers', 'Keith', 'Garrison', 'Vincent', 'Shields', 'Horn', 'Savage', 'Olsen', 'Schroeder', 'Hartman', 'Woodard', 'Mueller', 'Kemp', 'Deleon', 'Booth', 'Patel', 'Calhoun', 'Wiley', 'Eaton', 'Cline', 'Navarro', 'Harrell', 'Lester', 'Humphrey', 'Parrish', 'Duran', 'Hutchinson', 'Hess', 'Dorsey', 'Bullock', 'Robles', 'Beard', 'Dalton', 'Avila', 'Vance', 'Rich', 'Blackwell', 'York', 'Johns', 'Blankenship', 'Trevino', 'Salinas', 'Campos', 'Pruitt', 'Moses', 'Callahan', 'Golden', 'Montoya', 'Hardin', 'Guerra', 'Mcdowell', 'Carey', 'Stafford', 'Gallegos', 'Henson', 'Wilkinson', 'Booker', 'Merritt', 'Miranda', 'Atkinson', 'Orr', 'Decker', 'Hobbs', 'Preston', 'Tanner', 'Knox', 'Pacheco', 'Stephenson', 'Glass', 'Rojas', 'Serrano', 'Marks', 'Hickman', 'English', 'Sweeney', 'Strong', 'Prince', 'Mcclure', 'Conway', 'Walter', 'Roth', 'Maynard', 'Farrell', 'Lowery', 'Hurst', 'Nixon', 'Weiss', 'Trujillo', 'Ellison', 'Sloan', 'Juarez', 'Winters', 'Mclean', 'Randolph', 'Leon', 'Boyer', 'Villarreal', 'Mccall', 'Gentry', 'Carrillo', 'Kent', 'Ayers', 'Lara', 'Shannon', 'Sexton', 'Pace', 'Hull', 'Leblanc', 'Browning', 'Velasquez', 'Leach', 'Chang', 'House', 'Sellers', 'Herring', 'Noble', 'Foley', 'Bartlett', 'Mercado', 'Landry', 'Durham', 'Walls', 'Barr', 'Mckee', 'Bauer', 'Rivers', 'Everett', 'Bradshaw', 'Pugh', 'Velez', 'Rush', 'Estes', 'Dodson', 'Morse', 'Sheppard', 'Weeks', 'Camacho', 'Bean', 'Barron', 'Livingston', 'Middleton', 'Spears', 'Branch', 'Blevins', 'Chen', 'Kerr', 'Mcconnell', 'Hatfield', 'Harding', 'Ashley', 'Solis', 'Herman', 'Frost', 'Giles', 'Blackburn', 'William', 'Pennington', 'Woodward', 'Finley', 'Mcintosh', 'Koch', 'Best', 'Solomon', 'Mccullough', 'Dudley', 'Nolan', 'Blanchard', 'Rivas', 'Brennan', 'Mejia', 'Kane', 'Benton', 'Joyce', 'Buckley', 'Haley', 'Valentine', 'Maddox', 'Russo', 'Mcknight', 'Buck', 'Moon', 'Mcmillan', 'Crosby', 'Berg', 'Dotson', 'Mays', 'Roach', 'Church', 'Chan', 'Richmond', 'Meadows', 'Faulkner', 'Oneill', 'Knapp', 'Kline', 'Barry', 'Ochoa', 'Jacobson', 'Gay', 'Avery', 'Hendricks', 'Horne', 'Shepard', 'Hebert', 'Cherry', 'Cardenas', 'Mcintyre', 'Whitney', 'Waller', 'Holman', 'Donaldson', 'Cantu', 'Terrell', 'Morin', 'Gillespie', 'Fuentes', 'Tillman', 'Sanford', 'Bentley', 'Peck', 'Key', 'Salas', 'Rollins', 'Gamble', 'Dickson', 'Battle', 'Santana', 'Cabrera', 'Cervantes', 'Howe', 'Hinton', 'Hurley', 'Spence', 'Zamora', 'Yang', 'Mcneil', 'Suarez', 'Case', 'Petty', 'Gould', 'Mcfarland', 'Sampson', 'Carver', 'Bray', 'Rosario', 'Macdonald', 'Stout', 'Hester', 'Melendez', 'Dillon', 'Farley', 'Hopper', 'Galloway', 'Potts', 'Bernard', 'Joyner', 'Stein', 'Aguirre', 'Osborn', 'Mercer', 'Bender', 'Franco', 'Rowland', 'Sykes', 'Benjamin', 'Travis', 'Pickett', 'Crane', 'Sears', 'Mayo', 'Dunlap', 'Hayden', 'Wilder', 'Mckay', 'Coffey', 'Mccarty', 'Ewing', 'Cooley', 'Vaughan', 'Bonner', 'Cotton', 'Holder', 'Stark', 'Ferrell', 'Cantrell', 'Fulton', 'Lynn', 'Lott', 'Calderon', 'Rosa', 'Pollard', 'Hooper', 'Burch', 'Mullen', 'Fry', 'Riddle', 'Levy', 'David', 'Duke', 'Odonnell', 'Guy', 'Michael', 'Britt', 'Frederick', 'Daugherty', 'Berger', 'Dillard', 'Alston', 'Jarvis', 'Frye', 'Riggs', 'Chaney', 'Odom', 'Duffy', 'Fitzpatrick', 'Valenzuela', 'Merrill', 'Mayer', 'Alford', 'Mcpherson', 'Acevedo', 'Donovan', 'Barrera', 'Albert', 'Cote', 'Reilly', 'Compton', 'Raymond', 'Mooney', 'Mcgowan', 'Craft', 'Cleveland', 'Clemons', 'Wynn', 'Nielsen', 'Baird', 'Stanton', 'Snider', 'Rosales', 'Bright', 'Witt', 'Stuart', 'Hays', 'Holden', 'Rutledge', 'Kinney', 'Clements', 'Castaneda', 'Slater', 'Hahn', 'Emerson', 'Conrad', 'Burks', 'Delaney', 'Pate', 'Lancaster', 'Sweet', 'Justice', 'Tyson', 'Sharpe', 'Whitfield', 'Talley', 'Macias', 'Irwin', 'Burris', 'Ratliff', 'Mccray', 'Madden', 'Kaufman', 'Beach', 'Goff', 'Cash', 'Bolton', 'Mcfadden', 'Levine', 'Good', 'Byers', 'Kirkland', 'Kidd', 'Workman', 'Carney', 'Dale', 'Mcleod', 'Holcomb', 'England', 'Finch', 'Head', 'Burt', 'Hendrix', 'Sosa', 'Haney', 'Franks', 'Sargent', 'Nieves', 'Downs', 'Rasmussen', 'Bird', 'Hewitt', 'Lindsay', 'Le', 'Foreman', 'Valencia', 'Oneil', 'Delacruz', 'Vinson', 'Dejesus', 'Hyde', 'Forbes', 'Gilliam', 'Guthrie', 'Wooten', 'Huber', 'Barlow', 'Boyle', 'Mcmahon', 'Buckner', 'Rocha', 'Puckett', 'Langley', 'Knowles', 'Cooke', 'Velazquez', 'Whitley', 'Noel', 'Vang']

  def generate_users(n, options={})
    start_id = options[:start_id] || 1
    n.times.inject([]) { |users, i| users << generate_user(start_id + i); users }
  end

  def generate_user(gender=nil)
    gender = random_gender(gender)
    {
      app_id: 1,
      dev_id: 1,
      attrs: {
        gender: gender,
        fname: random_fname(gender, false),
        lname: SURNAMES.sample,
        birthday: random_birthday,
      },
      attrk: [:gender, :fname, :lname, :birthday],
    }
  end

  private

  def random_gender(gender=nil)
    ['f', 'm', 'F', 'M'].include?(gender) ? gender : (rand * 2).to_i == 1 ? 'm' : 'f'
  end

  def random_fname(gender=nil, validate=true)
    gender = random_gender(gender) if gender.nil? || validate
    %w[f F].include?(gender) ? FEMALE_FIRST_NAMES.sample : MALE_FIRST_NAMES.sample
  end

  def random_birthday(min_age=13, max_age=70)
    (Date.today - (rand * max_age + min_age) * 365 - rand * 365).to_time
  end
end
