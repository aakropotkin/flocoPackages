{

  inputs.packument.url   = "https://registry.npmjs.org/serialize-error?rev=33-9b8a4bbc3e06a50d4c01870321433640";
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
    ident = "serialize-error";
    ldir  = "info/unscoped/s/serialize-error";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
