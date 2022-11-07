{

  inputs.packument.url   = "https://registry.npmjs.org/no-case?rev=14-1f7f84e650634c736c84c8a9b106f64b";
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
    ident = "no-case";
    ldir  = "info/unscoped/n/no-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
