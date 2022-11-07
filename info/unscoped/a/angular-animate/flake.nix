{

  inputs.packument.url   = "https://registry.npmjs.org/angular-animate?rev=196-2bb09b50798f183d54715f81f1455be8";
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
    ident = "angular-animate";
    ldir  = "info/unscoped/a/angular-animate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
