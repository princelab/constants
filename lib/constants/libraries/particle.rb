require 'constants/libraries/physical'

module Constants
  module Libraries

    # Particle is a library of fundamental particles, including
    # mass, charge and spin information.
    class Particle

      attr_reader :name
      attr_reader :family
      attr_reader :group
      attr_reader :generation
      attr_reader :charge
      attr_reader :spin

      def initialize(name, family, group, generation, mass, charge, spin)
        @name = name
        @family = family
        @group = group
        @generation = generation
        @mass = mass.kind_of?(Constant) ? mass : Constant.parse(mass)
        @charge = charge
        @spin = spin
      end
      
      # Returns the mass of the particle.  
      def mass
        @mass.value
      end
      
      # Returns the mass uncertainty of the particle.  
      def mass_uncertainty
        @mass.uncertainty
      end
      
      private
      
      # Convenience method to define related particles (ex: antiparticles)
      def as(name, negate=false) # :nodoc:
        d = self.dup
        d.instance_variable_set("@name", name)
        d.instance_variable_set("@charge", charge * -1) if negate
        d
      end
      
      public
        
      UP = Particle.new('Up', "Fermion", "Quark", "First", "4 MeV/c^2", 2.0/3, 1.0/2) # "1.5 - 4 MeV/c^2"
      DOWN = Particle.new('Down', "Fermion", "Quark", "First", "8 MeV/c^2", -1.0/3, 1.0/2) # "	4 - 8 MeV/c^2"
      STRANGE = Particle.new('Strange', "Fermion", "Quark", "Second", "130 MeV/c^2", -1.0/3, 1.0/2) #"	80 - 130 MeV/c^2"
      CHARM = Particle.new('Charm', "Fermion", "Quark", "Second", "1.5 GeV/c^2", 2.0/3, 1.0/2)
      BOTTOM = Particle.new('Bottom', "Fermion", "Quark", "Third", "5 GeV/c^2", -1.0/3, 1.0/2)
      TOP = Particle.new('Top', "Fermion", "Quark", "Third", "170.9 GeV/c^2", 2.0/3, 1.0/2) #"170.9�18 GeV/c^2"
      
      ELECTRON = Particle.new('Electron', "Fermion", "Lepton", "First", "5.485 799 094(23)e-4 Da", 1, 1.0/2)
      POSITRON = ELECTRON.send(:as, "Positron", true)
      MUON = Particle.new('Muon', "Fermion", "Lepton", "Second", "105.658369(9) MeV/c^2", 1 , 1.0/2)
      ANTIMUON = MUON.send(:as, "Anti-Muon", true)
      TAU = Particle.new('Tau', "Fermion", "Lepton", "Third", "1776.99 MeV/c^2", 1, 1.0/2) #1776.99�29 MeV/c^2"
      ANTITAU = TAU.send(:as, "Anti-Tau", true)
      
      NEUTRINO = Particle.new('Neutrino', "Fermion", "Lepton", "", "5.485 799 0943(23)e-4 Da", 0, 1.0/2)
      ANTINEUTRINO = NEUTRINO.send(:as, "Anti-Neutrino")
      MUON_NEUTRINO = NEUTRINO.send(:as, "Muon Neutrio" )
      ANTIMUON_NEUTRINO = NEUTRINO.send(:as, "Muon Anti-Neutrino" )
      TAU_NEUTRINO = NEUTRINO.send(:as, "Tau Neutrino" )
      ANTITAU_NEUTRINO = NEUTRINO.send(:as, "Tau Anti-Neutrino" )
      
      PHOTON = Particle.new('Photon', "Boson", "Gauge boson", "", 0, 0, 1)
      W_BOSON_PLUS = Particle.new('W Boson +', "Boson", "Gauge boson", "", "80.398 GeV/c^2", 1, 1) #"80.398�0.025 GeV/c2"
      W_BOSON_MINUS = W_BOSON_PLUS.send(:as, "W Boson -", true)
      Z_BOSON = Particle.new('Z Boson', "Boson", "Gauge boson", "", "91.1876 GeV/c^2", 0, 1) #"91.1876�0.0021 GeV/c2",
      GLUON = Particle.new('Gluon', "Boson", "Gauge boson", "", 0, 0, 1)
      GRAVITON = Particle.new('Graviton', "", "", "", 0, 0, 2)
      HIGGS_BOSON = Particle.new('Higgs Boson', "", "", "", "112 GeV/c^2", 0, 0) #">112 GeV/c^2"
      
      include Constants::Library
      library.index_by_attribute :name
    end
    
  end
end