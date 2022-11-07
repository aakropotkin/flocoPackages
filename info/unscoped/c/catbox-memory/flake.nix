{

  inputs.packument.url   = "https://registry.npmjs.org/catbox-memory?rev=109-238d35933d283e79a1171960cef5aa27";
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
    ident = "catbox-memory";
    ldir  = "info/unscoped/c/catbox-memory";
    inherit packument fetchInfo;
  } // latest';

}
