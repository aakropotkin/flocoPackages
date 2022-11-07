{

  inputs.packument.url   = "https://registry.npmjs.org/@npmcli/installed-package-contents?rev=27-680435f6ea78586f9768a5bc7fff48db";
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
    scope = "@npmcli";
    ident = "@npmcli/installed-package-contents";
    ldir  = "info/npmcli/installed-package-contents";
    inherit packument fetchInfo;
  } // latest';

}
