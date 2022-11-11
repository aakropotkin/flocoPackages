let

  inherit ( builtins.getFlake "nixpkgs" ) lib;
  util = ( import ./. ) {};
  infodir = toString ../info;

  TODO = [
    "unscoped/o/oracledb/fetchInfo.json" 
  ];

  files = [ "antv/g2plot/fetchInfo.json" "discordjs/builders/fetchInfo.json" "discordjs/collection/fetchInfo.json" "discordjs/rest/fetchInfo.json" "humanwhocodes/gitignore-to-minimatch/fetchInfo.json" "oclif/config/fetchInfo.json" "oclif/core/fetchInfo.json" "restart/ui/fetchInfo.json" "types/cordova/fetchInfo.json" "types/json5/fetchInfo.json" "unscoped/a/adm-zip/fetchInfo.json" "unscoped/c/chai-as-promised/fetchInfo.json" "unscoped/c/char-regex/fetchInfo.json" "unscoped/c/clipboard/fetchInfo.json" "unscoped/c/csstype/fetchInfo.json" "unscoped/d/discord.js/fetchInfo.json" "unscoped/f/flux/fetchInfo.json" "unscoped/j/jest/fetchInfo.json" "unscoped/j/js-sdsl/fetchInfo.json" "unscoped/p/pngjs/fetchInfo.json" "unscoped/p/preact/fetchInfo.json" "unscoped/r/react-virtualized/fetchInfo.json" "unscoped/s/sinon-chai/fetchInfo.json" "unscoped/v/validator/fetchInfo.json" "unscoped/w/webpack/fetchInfo.json" "unscoped/x/xregexp/fetchInfo.json" ];
  #files = [ "antv/g2plot/fetchInfo.json" "discordjs/builders/fetchInfo.json" "discordjs/collection/fetchInfo.json" "discordjs/rest/fetchInfo.json" "humanwhocodes/gitignore-to-minimatch/fetchInfo.json" "oclif/config/fetchInfo.json" "oclif/core/fetchInfo.json" "restart/ui/fetchInfo.json" "types/cordova/fetchInfo.json" "types/json5/fetchInfo.json" "unscoped/a/adm-zip/fetchInfo.json" "unscoped/c/chai-as-promised/fetchInfo.json" "unscoped/c/char-regex/fetchInfo.json" "unscoped/c/clipboard/fetchInfo.json" "unscoped/c/csstype/fetchInfo.json" "unscoped/d/discord.js/fetchInfo.json" "unscoped/f/flux/fetchInfo.json" "unscoped/j/jest/fetchInfo.json" "unscoped/j/js-sdsl/fetchInfo.json" "unscoped/o/oracledb/fetchInfo.json" "unscoped/p/pngjs/fetchInfo.json" "unscoped/p/preact/fetchInfo.json" "unscoped/r/react-virtualized/fetchInfo.json" "unscoped/s/sinon-chai/fetchInfo.json" "unscoped/v/validator/fetchInfo.json" "unscoped/w/webpack/fetchInfo.json" "unscoped/x/xregexp/fetchInfo.json" ];
  recordIds = [ "@antv/g2plot" "@discordjs/builders" "@discordjs/collection" "@discordjs/rest" "@humanwhocodes/gitignore-to-minimatch" "@oclif/config" "@oclif/core" "@restart/ui" "@types/cordova" "@types/json5" "adm-zip" "chai-as-promised" "char-regex" "clipboard" "csstype" "discord.js" "flux" "jest" "js-sdsl" "oracledb" "pngjs" "preact" "react-virtualized" "sinon-chai" "validator" "webpack" "xregexp" ];

  ents = map ( f: {
    path = "${infodir}/${f}";
    ents = lib.importJSON "${infodir}/${f}";
    scope = builtins.replaceStrings ["@"] [""] ( builtins.head ( lib.splitString "/" f ) );
    bname = baseNameOf ( dirOf f );
  } ) files;


  records = map ( { scope, bname, ... } @ ent: ent // {
    ident = if scope == "unscoped" then bname else "@${scope}/${bname}";
  } ) ents;

  isFile = x: x.type == "file";
  filtFiles = builtins.filter isFile;
  filtFilesA = lib.filterAttrs ( _: isFile );
  getByIdent = ident:
    builtins.head ( builtins.filter ( x: x.ident == ident ) records );
  getVersions = ident:
    builtins.attrNames
      ( builtins.head
        ( builtins.filter ( x: x.ident == ident ) records ) ).ents;
  refetchFI = { url, ... }: {
    type = "tarball";
    inherit url;
    inherit ( builtins.fetchTree { type = "tarball"; inherit url; } ) narHash;
  }; 
  keyByIdent = builtins.foldl' ( acc: { ident, ... } @ ent: acc // { ${ident} = ent; } ) {};

  canUseTb = ident: let
    record = getByIdent ident;
    fs = filtFilesA record.ents;
    check = version: _: util.checkPerms { inherit ident version; };
  in lib.filterAttrs check fs;

  needPatch = map ( { ident, ents, ... } @ ent: let
    test = canUseTb ident;
  in builtins.trace ident ( builtins.deepSeq test ( builtins.trace
     "DONE: ${ident}"
     ent // { ents = ents // ( builtins.mapAttrs ( _: refetchFI ) test ); }
     ) ) )
     ( builtins.filter ( x: ! ( builtins.elem x.ident ["@types/cordova"] ) ) records );

  patched = keyByIdent needPatch;

  prepExport = { path, ents, ... } @ ent: let
    opath = builtins.replaceStrings ["/Users/alexameen/src/"] [""] path;
    dir = dirOf opath;
  in { __meta = { inherit dir; inherit (ent) bname ident scope; }; } // ents;

  prepped = map prepExport needPatch;

  export = let
    proc = acc: { __meta, ... } @ ent: let
      outFiles = {
        "fetchInfo.json" = builtins.toJSON ( removeAttrs ent ["__meta"] );
        "info.json" = builtins.toJSON __meta;
      };
      adds = {
        info.${__meta.scope} =
          if __meta.scope != "unscoped" then {
            ${__meta.bname} = outFiles;
          } else {
            ${( baseNameOf ( dirOf __meta.dir ) )}.${__meta.bname} = outFiles;
          };
      };
    in lib.recursiveUpdate acc adds;
  in builtins.foldl' proc {} prepped;

in export
