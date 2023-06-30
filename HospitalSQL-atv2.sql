CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

CREATE TABLE IF NOT EXISTS paciente(
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(255) NOT NULL,
	rg VARCHAR(20) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	data_nascimento DATE NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	convenio_id INT NOT NULL,
	email VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

CREATE TABLE IF NOT EXISTS convenio(
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(100) NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
	tempo_carencia INT NOT NULL
);

CREATE TABLE IF NOT EXISTS especialidades(
	id_especialidade INT PRIMARY KEY auto_increment,
    especialidades VARCHAR(90) NOT NULL
);

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
    
    CREATE TABLE IF NOT EXISTS receita(
    id INT PRIMARY KEY auto_increment,
    nome_paciente VARCHAR(255) NOT NULL,
    medicamento VARCHAR(255) NOT NULL,
    quant_medicamento INT NOT NULL,
    intrucoes LONGTEXT NOT NULL,
    validade DATE NOT NULL,
    consulta_id INT NOT NULL,
    FOREIGN KEY (consulta_id) REFERENCES consulta(id)
    );
    
    SELECT * FROM receita;
    
    CREATE TABLE IF NOT EXISTS enfermeiro(
	id_enfermeiro INT PRIMARY KEY auto_increment,
    nome VARCHAR(255) NOT NULL,
	cre VARCHAR(15) NOT NULL,
	cpf VARCHAR(14) NOT NULL
);

CREATE TABLE IF NOT EXISTS tipo_quarto(
	id_tipo_quarto INT PRIMARY KEY auto_increment,
	valor_diaria INT NOT NULL,
    descricao_quarto LONGTEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS quarto(
	id_quarto INT PRIMARY KEY auto_increment,
	numero_quarto INT NOT NULL,
	tipo_quarto_id INT NOT NULL,
    FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id_tipo_quarto)
);

    
    
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
    


