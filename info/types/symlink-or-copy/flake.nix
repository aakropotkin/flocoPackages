{

  inputs.packument.url   = "https://registry.npmjs.org/@types/symlink-or-copy?rev=320-bc83ab10487603264342a71cc953ec07";
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
    scope = "@types";
    ident = "@types/symlink-or-copy";
    ldir  = "info/types/symlink-or-copy";
    inherit packument fetchInfo;
  } // latest';

}
