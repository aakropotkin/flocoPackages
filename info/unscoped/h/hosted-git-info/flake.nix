{

  inputs.packument.url   = "https://registry.npmjs.org/hosted-git-info?rev=105-52f6b0f930cd395b252026e6cc3d11d7";
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
    ident = "hosted-git-info";
    ldir  = "info/unscoped/h/hosted-git-info";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
