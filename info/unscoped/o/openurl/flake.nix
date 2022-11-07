{

  inputs.packument.url   = "https://registry.npmjs.org/openurl?rev=18-0bb9178266cd4d110f98bf3b9becc586";
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
    ident = "openurl";
    ldir  = "info/unscoped/o/openurl";
    inherit packument fetchInfo;
  } // latest';

}
