{

  inputs.packument.url   = "https://registry.npmjs.org/react-markdown?rev=113-e4388f4688043727f6397c4731555898";
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
    ident = "react-markdown";
    ldir  = "info/unscoped/r/react-markdown";
    inherit packument fetchInfo;
  } // latest';

}
