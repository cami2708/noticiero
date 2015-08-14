<?php
$translations = array(
  // groupkey if no grouping is done
  'all' => 'Todos',
  // Month names entries are compared against for sorting issues
  'months' => array('01' => 'enero', '02' => 'febrero',
                    '03' => 'marzo', '04' => 'abril',
                    '05' => 'mayo', '06' => 'junio',
                    '07' => 'julio', '08' => 'agosto',
                    '09' => 'septiembre', '10' => 'octubre', 
                    '11' => 'noviembre', '12' => 'diciembre'),
                    
  // Representations of entry types used as headlines
  'entrytypes' => array('article'       => 'Artículo',
                        'book'          => 'Libros',
                        'booklet'       => 'Folletos',
                        'conference'    => 'Publicaciones en Conferencia',
                        'inbook'        => 'En Libros',
                        'incollection'  => 'En Collecciones',
                        'inproceedings' => 'En Proceso',
                        'manual'        => 'Manuales',
                        'mastersthesis' => 'Tesis de Master',
                        'misc'          => 'Diverso',
                        'phdthesis'     => 'Disertaciones',
                        'proceedings'   => 'Actas',
                        'techreport'    => 'Reportes Técnicos',
                        'unpublished'   => 'No Publicado',

                        // Map non-standard types to this type
                        'unknown'       => 'misc')
);
?>
