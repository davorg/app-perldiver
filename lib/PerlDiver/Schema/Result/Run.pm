use utf8;
package PerlDiver::Schema::Result::Run;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

PerlDiver::Schema::Result::Run

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<run>

=cut

__PACKAGE__->table("run");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 repo_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 date

  data_type: 'datetime'
  default_value: current_timestamp
  is_nullable: 0

=head2 data

  data_type: 'json'
  is_nullable: 1

=head2 notes

  data_type: 'longtext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "repo_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "date",
  {
    data_type     => "datetime",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "data",
  { data_type => "json", is_nullable => 1 },
  "notes",
  { data_type => "longtext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 repo

Type: belongs_to

Related object: L<PerlDiver::Schema::Result::Repo>

=cut

__PACKAGE__->belongs_to(
  "repo",
  "PerlDiver::Schema::Result::Repo",
  { id => "repo_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 run_files

Type: has_many

Related object: L<PerlDiver::Schema::Result::RunFile>

=cut

__PACKAGE__->has_many(
  "run_files",
  "PerlDiver::Schema::Result::RunFile",
  { "foreign.run_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-09-06 16:04:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U2ufaaXKoUh3aFInWa8Thg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
