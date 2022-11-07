{

  inputs.packument.url   = "https://registry.npmjs.org/@juggle/resize-observer?rev=69-0ba0a180545fe3f1df63505af05432e8";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
