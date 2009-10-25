use MooseX::Declare;

class MooseX::Explain {
    method explain(Str $name) {
        Class::MOP::load_class($name) unless Class::MOP::is_class_loaded($name);
        
        my $tree = {};
        
        $tree->{type} = $self->get_type($name);
        
        return $tree;
    }
    
    method get_type(Str $name) {
        return 'other' unless $name->can('meta');
        
        my $meta = $name->meta;
        
        if ($meta->isa('Moose::Meta::Class')) {
            return 'class';
        } elsif ($meta->isa('Moose::Meta::Role')) {
            return 'role';
        }
    }
}

1;