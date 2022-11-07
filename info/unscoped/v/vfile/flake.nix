{

  inputs.packument.url   = "https://registry.npmjs.org/vfile?rev=43-7b470ca83f6916ec50dbb6109c0a13ea";
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
    ident = "vfile";
    ldir  = "info/unscoped/v/vfile";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
