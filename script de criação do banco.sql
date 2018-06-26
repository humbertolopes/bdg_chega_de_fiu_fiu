  -- Create table tbl_tipo_assedio
  CREATE TABLE tbl_tipo_assedio (
    id_tipo_assedio INTEGER UNIQUE,
    desc_tipo_assedio TEXT
  );

  -- Create table tbl_escolaridade
  CREATE TABLE tbl_escolaridade (
    id_escolaridade INTEGER UNIQUE,
    desc_escolaridade TEXT
  );

  -- Create table tbl_cor_pele
  CREATE TABLE tbl_cor_pele (
    id_cor_pele INTEGER UNIQUE,
    desc_cor_pele TEXT
  );

  -- Create table tbl_periodo_assedio
  CREATE TABLE tbl_periodo_assedio (
    id_periodo_assedio INTEGER UNIQUE,
    desc_periodo_assedio TEXT
  );

  -- Create table tbl_assedio
  CREATE TABLE tbl_assedio (
    id_assedio INTEGER UNIQUE,
    data_assedio DATE,
    desc_assedio TEXT,
    idade INTEGER,
    registro_anonimo BOOLEAN,
    data_inc_assedio DATE,
    cidade TEXT,
    estado TEXT,
    fk_id_tipo_assedio INTEGER,
    fk_id_periodo_assedio INTEGER,
    fk_id_escolaridade INTEGER,
    fk_id_renda INTEGER,
    fk_id_cor_pele INTEGER,
    geom geometry(Point, 4326)
  );

  -- Create the spatial index on geom column of tbl_assedio
  CREATE INDEX SIDX_tbl_assedio
    ON tbl_assedio
    USING GIST (geom);

  -- Create table tbl_renda
  CREATE TABLE tbl_renda (
    id_renda INTEGER UNIQUE,
    desc_renda TEXT
  );

  -- Add foreign key constraint on table tbl_assedio due conventional-relationship-tbl_assedio--tbl_escolaridade
  ALTER TABLE tbl_assedio ADD
    CONSTRAINT fk_tbl_assedio_ref_tbl_escolaridade
    FOREIGN KEY (fk_id_escolaridade)
    REFERENCES tbl_escolaridade(id_escolaridade);

  -- Add foreign key constraint on table tbl_assedio due conventional-relationship-tbl_assedio--tbl_renda
  ALTER TABLE tbl_assedio ADD
    CONSTRAINT fk_tbl_assedio_ref_tbl_renda
    FOREIGN KEY (fk_id_renda)
    REFERENCES tbl_renda(id_renda);

  -- Add foreign key constraint on table tbl_assedio due conventional-relationship-tbl_assedio--tbl_periodo_assedio
  ALTER TABLE tbl_assedio ADD
    CONSTRAINT fk_tbl_assedio_ref_tbl_periodo_assedio
    FOREIGN KEY (fk_id_periodo_assedio)
    REFERENCES tbl_periodo_assedio(id_periodo_assedio);
  -- Add foreign key constraint on table tbl_assedio due conventional-relationship-tbl_cor_pele--tbl_assedio
  ALTER TABLE tbl_assedio ADD
    CONSTRAINT fk_tbl_assedio_ref_tbl_cor_pele
    FOREIGN KEY (fk_id_cor_pele)
    REFERENCES tbl_cor_pele(id_cor_pele);

  -- Add foreign key constraint on table tbl_assedio due conventional-relationship-tbl_assedio--tbl_tipo_assedio
  ALTER TABLE tbl_assedio ADD
    CONSTRAINT fk_tbl_assedio_ref_tbl_tipo_assedio
    FOREIGN KEY (fk_id_tipo_assedio)
    REFERENCES tbl_tipo_assedio(id_tipo_assedio);
