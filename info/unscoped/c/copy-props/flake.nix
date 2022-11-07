{

  inputs.packument.url   = "https://registry.npmjs.org/copy-props?rev=25-707414ad4bfca0847fb3c148bdd597b3";
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
    ident = "copy-props";
    ldir  = "info/unscoped/c/copy-props";
    inherit packument fetchInfo;
  } // latest';

}
