{

  inputs.packument.url   = "https://registry.npmjs.org/react-color?rev=89-1ab06fe95650c45cbde339b56bc5b294";
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
    ident = "react-color";
    ldir  = "info/unscoped/r/react-color";
    inherit packument fetchInfo;
  } // latest';

}
