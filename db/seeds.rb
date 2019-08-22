p=Paper.new(name:'Science')
q=p.questions.new(question:'Who is honoured as Father of Modern Chemistry?',qtype:'MCQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Antoine Lavoisier',is_correct:1)
q.options.new(answer:'David Joseph',is_correct:0)
q.options.new(answer:'Rinky Martin',is_correct:0)
q.options.new(answer:'Newton',is_correct:0)

q=p.questions.new(question:'Who invented periodic table?',qtype:'MCQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Dmitri Mendeleev',is_correct:1)
q.options.new(answer:'David Joseph',is_correct:0)
q.options.new(answer:'Rinky Martin',is_correct:0)
q.options.new(answer:'Newton',is_correct:0)

q=p.questions.new(question:"Which is the most abundant gas in the earth's atmosphere?",qtype:'MCQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Nitrogen 78.08%',is_correct:1)
q.options.new(answer:'Hydrogen',is_correct:0)
q.options.new(answer:'Carbon-di-oxide',is_correct:0)
q.options.new(answer:'Helium',is_correct:0)

q=p.questions.new(question:'Which gas evolved from paddy fields and marshes?',qtype:'MCQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Methane',is_correct:1)
q.options.new(answer:'Hydrogen',is_correct:0)
q.options.new(answer:'Carbon-di-oxide',is_correct:0)
q.options.new(answer:'Helium',is_correct:0)

q=p.questions.new(question:'Which toxic element present in automobile exhausts?',qtype:'MCQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Lead',is_correct:1)
q.options.new(answer:'Iron',is_correct:0)
q.options.new(answer:'copper',is_correct:0)
q.options.new(answer:'Tustin',is_correct:0)

q=p.questions.new(question:'Which gases cause acid rain? \"you can select multiple answer\"',qtype:'MAQ',correct: 1, incorrect: -1, unattempted: 0,duration:120)
q.options.new(answer:'Sulphur dioxide',is_correct:1)
q.options.new(answer:'Hydrogen',is_correct:0)
q.options.new(answer:'Nitrogen oxides',is_correct:1)
q.options.new(answer:'Carbon-di-oxide',is_correct:0)

p.save