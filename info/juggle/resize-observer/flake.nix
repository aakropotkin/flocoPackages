{

  inputs.packument.url   = "https://registry.npmjs.org/@juggle/resize-observer";
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
    scope = "@juggle";
    ident = "@juggle/resize-observer";
    ldir  = "info/juggle/resize-observer";
    inherit packument fetchInfo;
  } // latest';

}
