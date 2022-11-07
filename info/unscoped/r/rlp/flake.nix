{

  inputs.packument.url   = "https://registry.npmjs.org/rlp?rev=68-19771a76db7f81bb00e6723de7fce0ae";
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
    ident = "rlp";
    ldir  = "info/unscoped/r/rlp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
