{

  inputs.packument.url   = "https://registry.npmjs.org/default-compare?rev=1-5aca40ba2a1b5d22d3f61ea5aa935a89";
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
    ident = "default-compare";
    ldir  = "info/unscoped/d/default-compare";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
