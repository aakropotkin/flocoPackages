{

  inputs.packument.url   = "https://registry.npmjs.org/shelljs?rev=596-ee52a294216c26f47263fdc2a7a766db";
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
    ident = "shelljs";
    ldir  = "info/unscoped/s/shelljs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
