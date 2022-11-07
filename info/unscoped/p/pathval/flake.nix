{

  inputs.packument.url   = "https://registry.npmjs.org/pathval?rev=21-2c490ca7f605dac95e8fee78fa5c545e";
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
    ident = "pathval";
    ldir  = "info/unscoped/p/pathval";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
