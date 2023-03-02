{

# ---------------------------------------------------------------------------- #

  inputs.floco.url       = "github:aakropotkin/floco";
  inputs.nixpkgs.follows = "/floco/nixpkgs";

# ---------------------------------------------------------------------------- #

  outputs = { nixpkgs, floco, ... } @ inputs: let

# ---------------------------------------------------------------------------- #

    supportedSystems = [
      "x86_64-linux"  "aarch64-linux"  "i686-linux" 
      "x86_64-darwin" "aarch64-darwin"
    ];

    eachSupportedSystemMap = f: builtins.foldl' ( acc: system: acc // {
      ${system} = f system;
    } ) {} supportedSystems;


# ---------------------------------------------------------------------------- #

    nixosModules.default       = nixosModules.flocoPackages;
    nixosModules.flocoPackages = {
      imports = [floco.nixosModules.floco ./fpkgs];
    };
    nixosModules.useFetchZip = floco.nixosModules.useFetchZip;


# ---------------------------------------------------------------------------- #

    overlays.deps          = floco.overlays.default;
    overlays.flocoPackages = final: prev: let
      inherit (final) lib;
      mod = lib.evalModules {
        modules = [
          nixosModules.flocoPackages
          nixosModules.useFetchZip
          {
            config.floco.settings.system          = prev.system;
            config._module.args.pkgs              = prev;
            config.floco.buildPlan.deriveTreeInfo = true;
          }
        ];
      };
      exports = let
        ignored = [

          "@jest/test-sequencer"
          "@webassemblyjs/ast"
          "@webassemblyjs/helper-code-frame"
          "@webassemblyjs/helper-module-context"
          "@webassemblyjs/helper-wasm-section"
          "@webassemblyjs/wasm-edit"
          "@webassemblyjs/wasm-gen"
          "@webassemblyjs/wasm-opt"
          "@webassemblyjs/wasm-parser"
          "@webassemblyjs/wast-parser"
          "@webassemblyjs/wast-printer"
          "airbnb-prop-types"
          "array-includes"
          "array.prototype.filter"
          "array.prototype.find"
          "array.prototype.flat"
          "array.prototype.flatmap"
          "array.prototype.tosorted"
          "enzyme"
          "enzyme-adapter-react-16"
          "enzyme-adapter-utils"
          "es-abstract"
          "eslint-plugin-import"
          "eslint-plugin-jsx-a11y"
          "eslint-plugin-react"
          "function.prototype.name"
          "global-modules"
          "html-element-map"
          "jest-config"
          "jest-jasmine2"
          "jest-runner"
          "jsx-ast-utils"
          "object.entries"
          "object.hasown"
          "object.fromentries"
          "object.values"
          "resolve-dir"
          "string.prototype.trimend"
          "string.prototype.trimstart"
          "string.prototype.trim"
          "string.prototype.matchall"

        ];
        all = builtins.foldl' ( acc: ident:
          acc ++ ( builtins.attrValues mod.config.floco.packages.${ident} )
        ) [] ( builtins.attrNames (
          removeAttrs mod.config.floco.packages ignored
        ) );
      in builtins.filter ( v: lib.isDerivation ( v.global or null ) ) all;
    in {
      flocoPackages = builtins.foldl' ( acc: pkg: let
        ident   = dirOf pkg.key;
        version = baseNameOf pkg.key;
      in acc // {
        ${ident} = ( acc.${ident} or {} ) // {
          ${version} = pkg.global // {
            passthru = ( pkg.global.passthru or {} ) // {
              inherit (pkg) prepared;
              inherit ident version;
            };
          };
        };
      } ) {} exports;
    };

    overlays.default = nixpkgs.lib.composeExtensions overlays.deps
                                                     overlays.flocoPackages;


# ---------------------------------------------------------------------------- #

    packages = eachSupportedSystemMap ( system: let
      pkgsFor    = nixpkgs.legacyPackages.${system}.extend overlays.default;
      pickLatest = versions: let
        cmp = a: b: let
          i = builtins.compareVersions ( a.version or a ) ( b.version or b );
        in 0 < i;
        pick = a: b: if cmp a b then a else b;
        len = builtins.length versions;
        fst = builtins.head versions;
      in if len == 1 then fst else
         if len == 2 then pick fst ( builtins.elemAt versions 1 ) else
         builtins.foldl' pick ( builtins.head versions )
                              ( builtins.tail versions );
    in builtins.mapAttrs ( _: vs: pickLatest ( builtins.attrValues vs ) )
                         pkgsFor.flocoPackages
  );


# ---------------------------------------------------------------------------- #

  in {

# ---------------------------------------------------------------------------- #

    inherit (floco) lib;

# ---------------------------------------------------------------------------- #

    inherit overlays nixosModules packages;

# ---------------------------------------------------------------------------- #

    legacyPackages = eachSupportedSystemMap ( system: let
      pkgsFor = nixpkgs.legacyPackages.${system}.extend overlays.default;
    in pkgsFor.flocoPackages );


# ---------------------------------------------------------------------------- #

    checks = packages;


# ---------------------------------------------------------------------------- #

    info = let
      mod = floco.lib.evalModules { modules = [nixosModules.default]; };
      pdefsKeyed = let
        idal = builtins.mapAttrs ( ident: versions:
          map ( { key, _export, ... }: { name = key; value = _export; } )
              ( builtins.attrValues versions )
        ) mod.config.floco.pdefs;
        idl = builtins.attrValues idal;
      in builtins.listToAttrs ( builtins.concatLists idl );
    in {
      inherit pdefsKeyed;
      pdefs = builtins.mapAttrs ( _: builtins.mapAttrs ( _: v: v._export ) )
                                mod.config.floco.pdefs;
      pdefsList = builtins.attrValues pdefsKeyed;
    };


# ---------------------------------------------------------------------------- #

  };  # End `outputs'


# ---------------------------------------------------------------------------- #

}


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
