{

  inputs.packument.url   = "https://registry.npmjs.org/statuses?rev=68-896d2fcf57f158ee712a0aba0cb2cd40";
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
    ident = "statuses";
    ldir  = "info/unscoped/s/statuses";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
