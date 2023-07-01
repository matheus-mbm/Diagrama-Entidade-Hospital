DROP DATABASE IF EXISTS hospital;
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;


CREATE TABLE IF NOT EXISTS convenio(
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(100) NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
	tempo_carencia VARCHAR(90) NOT NULL
);

INSERT INTO convenio (nome, cnpj, tempo_carencia)VALUES
  ('Unimed', '111111111', '5 anos'),
  ('SulAmérica', '222222222', '11 meses'),
  ('Bradesco Saúde', '333333333', '5 meses'),
  ('Amil', '4444444444', '2 anos');


CREATE TABLE IF NOT EXISTS paciente(
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(255) NOT NULL,
	rg VARCHAR(20) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	data_nascimento DATE NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	convenio_id INT,
	email VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

INSERT INTO paciente (nome, rg, cpf, data_nascimento, endereco, convenio_id, email, telefone)VALUES
  ('Ana Silva', '1234567', '11111111111', '1990-02-10', 'Rua A, 123','2', 'ana.silva@example.com', '111111111'),
  ('Pedro Santos', '2345678', '22222222222', '1985-07-15', 'Avenida B, 456','1', 'pedro.santos@example.com', '222222222'),
  ('Mariana Souza', '3456789', '33333333333', '1992-04-20', 'Rua C, 789','3', 'mariana.souza@example.com', '333333333'),
  ('Carlos Pereira', '4567890', '44444444444', '1978-09-25', 'Avenida D, 987','4', 'carlos.pereira@example.com', '444444444'),
  ('Luisa Lima', '5678901', '55555555555', '1995-06-05', 'Rua E, 654','4', 'luisa.lima@example.com', '555555555'),
  ('Rafael Mendes', '6789012', '66666666666', '1988-11-10', 'Avenida F, 321','1', 'rafael.mendes@example.com', '666666666'),
  ('Fernanda Costa', '7890123', '77777777777', '1993-09-12', 'Rua G, 987','3', 'fernanda.costa@example.com', '777777777'),
  ('Lucas Almeida', '8901234', '88888888888', '1980-12-15', 'Avenida H, 654','2', 'lucas.almeida@example.com', '888888888'),
  ('Camila Fernandes', '9012345', '99999999999', '1987-07-20', 'Rua I, 321','2', 'camila.fernandes@example.com', '999999999'),
  ('Gustavo Castro', '0123456', '00000000000', '1994-05-18', 'Avenida J, 789','1', 'gustavo.castro@example.com', '000000000'),
  ('Julia Cardoso', '12345678', '11111111112', '1991-03-08', 'Rua K, 234','3', 'julia.cardoso@example.com', '111111112'),
  ('Ricardo Mendonça', '23456789', '22222222223', '1986-08-28', 'Avenida L, 567','4', 'ricardo.mendonca@example.com', '222222223'),
  ('Isabela Lima', '34567890', '33333333334', '1997-01-23', 'Rua M, 890','4', 'isabela.lima@example.com', '333333334'),
  ('Gabriel Fernandes', '45678901', '44444444445', '1981-04-03', 'Avenida N, 123','2', 'gabriel.fernandes@example.com', '444444445'),
  ('Amanda Castro', '56789012', '55555555556', '1996-02-13', 'Rua O, 456','1', 'amanda.castro@example.com', '555555556');

CREATE TABLE IF NOT EXISTS especialidades(
	id_especialidade INT PRIMARY KEY auto_increment,
    especialidades VARCHAR(90) NOT NULL
);

INSERT INTO especialidades(especialidades) VALUES 
	('Pediatria'),
	('Clínica Geral'),
	('Gastrenterologia'),
	('Dermatologia'),
	('Oftalmologia'),
	('Endocrinologia'),
	('Cardiologia');

CREATE TABLE IF NOT EXISTS medico(
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(255) NOT NULL,
	crm VARCHAR(15) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	data_nascimento DATE NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
    cargo VARCHAR(90) NOT NULL,
	especialidade_id INT NOT NULL,
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id_especialidade)
);

INSERT INTO medico (nome, crm, cpf, data_nascimento, endereco, email, cargo, especialidade_id) VALUES
  ('João Silva', '12345', '11111111111', '1980-05-15', 'Rua A, 123', 'joao.silva@example.com', 'Cardiologista', '7'),
  ('Maria Santos', '23456', '22222222222', '1985-08-20', 'Avenida B, 456', 'maria.santos@example.com', 'Pediatra', '1'),
  ('Carlos Souza', '34567', '33333333333', '1990-01-10', 'Rua C, 789', 'carlos.souza@example.com', 'Endocrinologia', '6'),
  ('Ana Pereira', '45678', '44444444444', '1975-03-25', 'Avenida D, 987', 'ana.pereira@example.com', 'Gastrenterologia', '3'),
  ('Fernanda Lima', '56789', '55555555555', '1988-07-05', 'Rua E, 654', 'fernanda.lima@example.com', 'Dermatologista', '4'),
  ('Ricardo Mendes', '67890', '66666666666', '1982-11-30', 'Avenida F, 321', 'ricardo.mendes@example.com', 'Pediatria', '1'),
  ('Juliana Costa', '78901', '77777777777', '1987-09-12', 'Rua G, 987', 'juliana.costa@example.com', 'Oftalmologista', '5'),
  ('Pedro Almeida', '89012', '88888888888', '1984-12-03', 'Avenida H, 654', 'pedro.almeida@example.com', 'Endocrinologia', '6'),
  ('Luisa Fernandes', '90123', '99999999999', '1979-06-20', 'Rua I, 321', 'luisa.fernandes@example.com', 'Clínico Geral', '2'),
  ('Mariana Castro', '01234', '00000000000', '1983-04-18', 'Avenida J, 789', 'mariana.castro@example.com', 'Cardiologia', '7');


CREATE TABLE IF NOT EXISTS consulta(
	id INT PRIMARY KEY auto_increment,
	`data` DATE NOT NULL,
	valor INT NOT NULL,
	especialidade_id INT NOT NULL,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    FOREIGN KEY (especialidade_id) REFERENCES especialidades(id_especialidade),
	FOREIGN KEY (medico_id) REFERENCES medico(id),
	FOREIGN KEY (paciente_id) REFERENCES paciente(id)
    );
    
    INSERT INTO consulta ( data, valor, especialidade_id, medico_id, paciente_id) VALUES
	('2022/05/12', '50', '3', '10', '10'),
    ('2022/05/12', '50', '2', '9', '10'),
    ('2016/08/05', '70', '1', '6', '5'),
    ('2018/02/16', '35', '4', '5', '8'),
	('2020/07/22', '80', '3', '4', '8'),
	('2015/03/01', '75', '7', '1', '15'),
    ('2019/08/12', '100', '1', '2', '7'),
	('2022/11/03', '150', '1', '2', '2'),
    ('2021/12/02', '120', '4', '5', '2'),
    ('2015/05/25', '80', '5', '7', '1'),
    ('2016/08/30', '50', '3', '4', '3'),
    ('2017/07/29', '170', '6', '3', '15'),
    ('2017/09/17', '190', '2', '9', '13'),
    ('2015/10/16', '80', '6', '8', '10'),
    ('2022/10/27', '140', '5', '7', '7'),
    ('2021/01/05', '80', '5', '7', '6'),
    ('2021/02/04', '140', '1', '6', '3'),
    ('2020/02/24', '90', '7', '10', '5'),
    ('2017/04/30', '75', '2', '9', '12'),
    ('2018/09/01', '65', '4', '1', '6');
    
    SELECT * FROM receita;
    
    CREATE TABLE IF NOT EXISTS receita(
    id INT PRIMARY KEY auto_increment,
    nome_paciente VARCHAR(255) NOT NULL,
    medicamento VARCHAR(255) NOT NULL,
    quant_medicamento INT NOT NULL,
    inStrucoes LONGTEXT NOT NULL,
    validade VARCHAR(90) NOT NULL,
    consulta_id INT NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES consulta(id)
    );
    SELECT * FROM paciente;
    INSERT INTO receita(nome_paciente, medicamento, quant_medicamento, instrucoes, validade, consulta_id)VALUES
	('Ana Silva', 'Paracetamol', 50, 'Tomar 1 comprimido a cada 6 horas', '1 semana', '10'),
	('Pedro Santos', 'Ibuprofeno', 30, 'Tomar 1 comprimido a cada 8 horas', '8 dias', '8' ),
	('Pedro Santos', 'Amoxicilina', 20, 'Tomar 1 cápsula de 500mg a cada 12 horas', '1 semana', '8'),
	('Mariana Souza', 'Omeprazol', 10, 'Tomar 1 comprimido antes do café da manhã', '4 dias', '11'),
	('Mariana Souza', 'Dipirona', 40, 'Tomar 1 comprimido a cada 6 horas, se necessário', '1 semana', '11'),
	('Fernanda Costa', 'Ranitidina', 15, 'Tomar 1 comprimido antes do jantar', '2 semanas', '15'),
	('Fernanda costa', 'Dexametasona', 25, 'Aplicar uma pomada fina na área afetada 2 vezes ao dia', '9 dias', '15'),
	('Ana Silva', 'Cetirizina', 60, 'Tomar 1 comprimido antes de dormir', '4 dias', '1'),
	('Amando Castro', 'Sulfametoxazol + Trimetoprima', 12, 'Tomar 1 comprimido a cada 12 horas com alimentos', '6 dias', '12'),
	('Amando Castro', 'Fluoxetina', 18, 'Tomar 1 comprimido por dia pela manhã', '2 semanas', '12'),
	('Gustavo Castro', 'Aspirina', 50, 'Tomar 1 comprimido a cada 4 horas, se necessário', '3 semanas', '14'),
	('Gustavo Castro', 'Loratadina', 30, 'Tomar 1 comprimido por dia', '1 semanas', '14'),
	('Rafael Mendes', 'Rivotril', 20, 'Tomar 1 comprimido antes de dormir', '5 dias', '20'),
	('Rafael Mendes', 'Atorvastatina', 10, 'Tomar 1 comprimido por dia à noite', '15 dias', '20'),
	('Ricardo Mendonça', 'Morfina', 40, 'Administrar conforme prescrição médica', '16 dias', '19'),
	('Ricardo Mendonça', 'Furosemida', 15, 'Tomar 1 comprimido pela manhã', '2 dias', '19'),
	('Luisa Lima', 'Metformina', 25, 'Tomar 1 comprimido duas vezes ao dia com as refeições', '4 dias', '18'),
	('Luisa Lima', 'Digoxina', 60, 'Tomar 1 comprimido por dia, de manhã', '1 semana', '18'),
	('Mariana Souza', 'Sertralina', 12, 'Tomar 1 comprimido por dia', '1 semana', '17'),
	('Mariana Souza', 'Insulina', 18, 'Administrar conforme prescrição médica', '2 semanas', '17');
    
    SELECT * FROM consulta;
    
    CREATE TABLE IF NOT EXISTS enfermeiro(
	id_enfermeiro INT PRIMARY KEY auto_increment,
    nome VARCHAR(255) NOT NULL,
	cre VARCHAR(15) NOT NULL,
	cpf VARCHAR(14) NOT NULL
);

INSERT INTO enfermeiro (nome, cre, cpf)VALUES
  ('João Silva', '12345', '11111111111'),
  ('Maria Santos', '23456', '22222222222'),
  ('Carlos Souza', '34567', '33333333333'),
  ('Ana Pereira', '45678', '44444444444'),
  ('Fernanda Lima', '56789', '55555555555'),
  ('Ricardo Mendes', '67890', '66666666666'),
  ('Juliana Costa', '78901', '77777777777'),
  ('Pedro Almeida', '89012', '88888888888'),
  ('Luisa Fernandes', '90123', '99999999999'),
  ('Mariana Castro', '01234', '00000000000');

CREATE TABLE IF NOT EXISTS tipo_quarto(
	id_tipo_quarto INT PRIMARY KEY auto_increment,
	valor_diaria INT NOT NULL,
    descricao_quarto LONGTEXT NOT NULL
);

INSERT INTO tipo_quarto(valor_diaria, descricao_quarto)VALUES
('150', 'Apartamento'),
('100', 'Quarto Duplo'),
('70', 'Enfermaria');



CREATE TABLE IF NOT EXISTS quarto(
	id_quarto INT PRIMARY KEY auto_increment,
	numero_quarto INT NOT NULL,
	tipo_quarto_id INT NOT NULL,
    FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id_tipo_quarto)
);

INSERT INTO quarto (numero_quarto, tipo_quarto_id)VALUES
	('156', '1'),
    ('66', '2'),
    ('15', '3'),
    ('152', '1'),
    ('213', '2'),
    ('111', '3');


    CREATE TABLE IF NOT EXISTS internacao(
    id_internacao INT PRIMARY KEY auto_increment,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE NOT NULL,
    data_alta DATE NOT NULL,
    procedimento LONGTEXT,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    enfermeiro_id INT NOT NULL,
    quarto_id INT NOT NULL,
    FOREIGN KEY (medico_id) REFERENCES medico(id),
	FOREIGN KEY (paciente_id) REFERENCES paciente(id),
	FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id_enfermeiro),
	FOREIGN KEY (quarto_id) REFERENCES quarto(id_quarto)
    );
    
INSERT INTO internacao (data_entrada, data_prev_alta, data_alta, procedimento, medico_id, paciente_id, enfermeiro_id, quarto_id)VALUES
  ('2023-01-01', '2023-01-05', '2023-01-04', 'Cirurgia de apendicite', '5', '15', '8', '1'),
  ('2023-02-10', '2023-02-15', '2023-02-12', 'Tratamento de fratura', '4', '5', '5', '6'),
  ('2023-03-20', '2023-03-25', '2023-03-24', 'Cirurgia de hérnia', '3', '8', '3', '3'),
  ('2023-04-05', '2023-04-10', '2023-04-09', 'Exame de endoscopia', '10', '6', '10', '5'),
  ('2023-05-15', '2023-05-20', '2023-05-18', 'Parto normal', '8', '7', '3', '2'),
  ('2023-06-25', '2023-06-30', '2023-06-29', 'Cirurgia de coluna', '2', '14', '2', '3'),
  ('2023-07-10', '2023-07-15', '2023-07-12', 'Tratamento de pneumonia', '9', '12', '1', '4');
  


 