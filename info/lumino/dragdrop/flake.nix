{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/dragdrop?rev=47-c480d241bc10b73c2b677bc7a4197ba1";
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
    scope = "@lumino";
    ident = "@lumino/dragdrop";
    ldir  = "info/lumino/dragdrop";
    inherit packument fetchInfo;
  } // latest';

}
