{

  inputs.packument.url   = "https://registry.npmjs.org/istanbul-lib-hook?rev=58-9a08d06fabbbac83349902f280b1eb4a";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "istanbul-lib-hook";
    ldir  = "info/unscoped/i/istanbul-lib-hook";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
