{

  inputs.packument.url   = "https://registry.npmjs.org/js-calendar?rev=27-da8edcac0e4f9a0eacabb0f96237403b";
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
    ident = "js-calendar";
    ldir  = "info/unscoped/j/js-calendar";
    inherit packument fetchInfo;
  } // latest';

}
