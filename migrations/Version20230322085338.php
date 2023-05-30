<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230322085338 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX category_id ON pizzas');
        $this->addSql('ALTER TABLE pizzas CHANGE category_id product_id INT NOT NULL');
        $this->addSql('ALTER TABLE pizzas ADD CONSTRAINT FK_C6CC6E404584665A FOREIGN KEY (product_id) REFERENCES categoriees (id)');
        $this->addSql('CREATE INDEX IDX_C6CC6E404584665A ON pizzas (product_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE pizzas DROP FOREIGN KEY FK_C6CC6E404584665A');
        $this->addSql('DROP INDEX IDX_C6CC6E404584665A ON pizzas');
        $this->addSql('ALTER TABLE pizzas CHANGE product_id category_id INT NOT NULL');
        $this->addSql('CREATE INDEX category_id ON pizzas (category_id)');
    }
}
