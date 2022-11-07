{

  inputs.packument.url   = "https://registry.npmjs.org/path-case?rev=26-5c8ece7f1014726eca819a6a89d0a76e";
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
    ident = "path-case";
    ldir  = "info/unscoped/p/path-case";
    inherit packument fetchInfo;
  } // latest';

}
